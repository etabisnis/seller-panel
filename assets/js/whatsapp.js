toastr.options = {
    "closeButton": true,
    "debug": false,
    "newestOnTop": true,
    "progressBar": true,
    "positionClass": "toast-top-right",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "300",
    "hideDuration": "1000",
    "timeOut": "5000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
}
function getValues(selector) {
    var els = document.querySelectorAll(selector);
    return [].map.call(els, el => el.value);
}
function makeid(length) {
    var result           = '';
    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
   return result;
}
const server = $('#host').attr('data');
const id = $('#waid').attr('data');
console.log(server)
ws = new WebSocket(`wss://${server}?token=${id}`);
ws.onopen = () => {
    handle(ws)
    user = id
    ws.send('status')
    ws.send('info')
}
ws.onmessage = (ev) => {
    try {
        const data = JSON.parse(ev.data)
        switch (data.type) {
            case 'info':
            if(data.data.webhook){
                $('#add-webhook').hide();
                $('#input-webhook').val(data.data.webhook);
                $('#remove-webhook').show();
            }
            $('#nomor-client').val(data.data.nomor);
            $('#name-client').val(data.data.name);
            $('#status-client').val(data.data.status);
            $('#status').text(data.data.status);
            break;
            case 'status':
            if(!data.data || (data.data && data.data == 'idle')){
                $('#qrcode').html(`<b>Waiting to Scan</b>`)
            }else if(data.data && data.data == 'running'){
                $('#qrcode').html(`<b>Connected to Server</b>`)
            }
            break;
            case 'upload-progress':
            $('#progressBarImage').show();
            $('#progressBarImage').attr('value', data.data.progress.toString());
            break;
            case 'upload':
            $('#progressBarImage').attr('value', "0");
            const files = $(`#${fileId}`).prop('files')
            if(files.length > 0){
                const blob = files[0]
                ws.send(JSON.stringify({
                    "cmd" : 1,
                    "data" : blob.name,
                    "size": blob.size,
                    "nohp": data.data.nohp,
                    "text": data.data.text,
                    "model": data.data.model,
                    "mimetype": data.data.mimetype
                }));
                const BYTES_PER_CHUNK = data.data.chunk;

                const SIZE = blob.size;

                var start = data.data.start;
                var end = BYTES_PER_CHUNK;

                while (start < SIZE) {

                    if ('mozSlice' in blob) {
                        var chunk = blob.mozSlice(start, end);
                    } else if ('slice' in blob) {
                        var chunk = blob.slice(start, end);
                    } else {
                        var chunk = blob.webkitSlice(start, end);
                    }
                    ws.send(chunk);
                    start = end;
                    end = start + BYTES_PER_CHUNK;
                }
                ws.send(JSON.stringify({
                    "cmd" : 2,
                    "data" : blob.name,
                    "nohp": data.data.nohp,
                    "text": data.data.text,
                    "model": data.data.model
                }));
            }
            break;
            case 'qr':
            $('#qrcode').html(`<img src="${data.data}"/>`)
            break;
            default:
            break;
        }
    } catch (error) {
        $('#log').append(`<p>${ev.data}</p>`)
    }
}
ws.onclose = () => {
    $('#log').prepend(`<p>Gagal Terhubung</p>`)
    ws = null
}
ws.onerror = () => {
    ws.close()
}
const handle = (ws) => {
    $('#btn-scan').click(function (e) { 
        e.preventDefault();
        ws.send('start')
        $('#qrcode').html()
    });
    $('#text-normal').click(function (e) {
        e.preventDefault();
        const nohp = $('#phonenumber').val();
        const text = $('#autosize-demo').val();
        ws.send(JSON.stringify(
        {
            "model": "text",
            "type": "send",
            "nohp": nohp,
            "text": text
        }, null, 2
        ))
        toastr.success('Message has been Sent');
    });
    $('#text-image').click(function (e) { 
        e.preventDefault();
        const files = $('#image-input').prop('files')
        fileId = 'image-input'
        const nohp = $('#phonenumber').val();
        const text = $('#autosize-demo').val();
        console.log(files)
        if(files.length > 0){
            const blob = files[0]
            const fsize = blob.size;
            const file = Math.round((fsize / 1024));
            if(file > 8000){
                toastr.warning('the file size is too large, a maximum of 8 MB')
                return
            }
            $('#text-image').attr('disabled', '');
            ws.send(JSON.stringify(            {
                "type": "prepare-upload",
                "file": "${blob.name}",
                "size": blob.size,
                "nohp": nohp,
                "text": text,
                "model": "image"
            }, null, 2))
            toastr.success('Message has been Sent');
        }
        else{
            toastr.warning('Failed Sent Message');
        }
    });
    $('#btn-doc').click(function (e) { 
        e.preventDefault();
        const files = $('#doc-input').prop('files')
        fileId = 'doc-input'
        const nohp = $('#phonenumber').val();
        if(files.length > 0){
            const blob = files[0]
            const fsize = blob.size;
            const file = Math.round((fsize / 1024));
            if(file > 8000){
                toastr.warning('the file size is too large, a maximum of 8 MB')
                return
            }
            ws.send(JSON.stringify(
            {
                "type": "prepare-upload",
                "file": blob.name,
                "size": blob.size,
                "nohp": nohp,
                "model": "document",
                "mimetype": blob.type
            }, null, 2
            ))
            toastr.success('Message has been Sent');
        }
        else{
            toastr.warning('Failed Sent Message');
        }
    });
    $('#location').click(function (e) {
        e.preventDefault();
        const nohp = $('#input-nohp').val();
        const degreesLatitude = lat;
        const degreesLongitude = lng;
        ws.send(JSON.stringify(
        {
            "model": "location",
            "type": "send",
            "nohp": nohp,
            "degreesLatitude": degreesLatitude,
            "degreesLongitude": degreesLongitude
        }, null, 2
        ))
        toastr.success('Message has been Sent');
    });
    $('#btn-button-link').click(function (e) {
        console.log('button link')
        e.preventDefault();
        const nohp = $('#phonenumber').val();
        const text = $('#link-caption').val();
        const btext = $('#link-button-text').val()
        const link = $('#link-url').val();
        ws.send(JSON.stringify(
            {
                "type": "send",
                "nohp": nohp,
                "model": "button-link",
                "url": link,
                "btext": btext,
                "text": text
            }
        ), null, 2)
        toastr.success('Message has been Sent');
    });
    $('#btn-copy').click(function (e) { 
        console.log('button copy')
        e.preventDefault();
        const nohp = $('#phonenumber-copy').val();
        const text = $('#btn-copy-caption').val();
        const btext = $('#text-btn-copy').val()
        const copy = $('#text-copy').val();
        ws.send(JSON.stringify(
            {
                "type": "send",
                "nohp": nohp,
                "model": "button-copy",
                "textCopy": copy,
                "btext": btext,
                "text": text
            }
        ), null, 2)
        toastr.success('Message has been Sent');
    });
    $('#btn-respons').click(function (e) { 
        console.log('button respons')
        e.preventDefault();
        const nohp = $('#phonenumber-respons').val();
        const text = $('#btn-respons-caption').val();
        const bts = getValues('#btn-respons-title');
        const ress = getValues('#btn-respons-res');
        const id = 1;
        const buttons = []
        const auto = []
        for (let i = 0; i < bts.length; i++) {
            const bt = bts[i];
            const res = ress[i];
            const ids = makeid(10)
            if(bt == '' || res == ''){
                continue;
            }
            buttons.push({
                buttonId: `${id}]${ids}`,
                buttonText: {
                    displayText: bt
                },
            })
            auto.push({
                id: ids,
                reply: {
                    text: res
                },
                file: null
            })
        }

        if(buttons.length > 0){
            $('#btn-button').attr('disabled', '');
            console.log(JSON.stringify(buttons, null, 2))
            console.log(JSON.stringify(auto, null, 2))
            ws.send(JSON.stringify(
                {
                    "type": "send",
                    "nohp": nohp,
                    "id": id,
                    "model": "button",
                    "buttons": buttons,
                    "auto": auto,
                    "text": text
                }
            ), null, 2)
            toastr.success('Message has been Sent');
        }
    });
    $('#btn-list-add').click(function (e) { 
        e.preventDefault();
        $('#list-msg').append(`
        <div class="col-xl-6 col-md-12 col-sm-12 mb-4">
            <label class="form-label" for="creditCardMask">Title</label>
            <div class="input-group input-group-merge">
                <input type="text" id="input-title-list" name="id" class="form-control credit-card-mask" placeholder="Button List Name" aria-describedby="creditCardMask2">
            </div>
        </div>
        <div class="col-xl-6 col-md-12 col-sm-12 mb-4">
            <label class="form-label" for="creditCardMask">Respons</label>
            <div class="input-group input-group-merge">
                <input type="text" id="input-res-list" name="id" class="form-control credit-card-mask" placeholder="Respons" aria-describedby="creditCardMask2">
            </div>
        </div>
        `);
    });
    $('#btn-list').click(function (e) { 
        e.preventDefault();
        console.log('button list')
        const nohp = $('#phonenumber-list').val();
        const idlist = 1;
        const btext = $('#input-btn-title-list').val();
        const text = $('#input-text-caption-list').val();
        const titles = getValues('#input-title-list')
        const ress = getValues('#input-res-list')
        const rows = []
        const auto = []
        for (let i = 0; i < titles.length; i++) {
            const title = titles[i];
            const res = ress[i];
            const id = makeid(10)
            rows.push({
                "title": title,
                "rowId": `${idlist}]${id}`
            })
            auto.push({
                id: id,
                reply: {
                    text: res
                },
                file: null
            })
        }
        ws.send(JSON.stringify(
            {
                "type": "send",
                "nohp": nohp,
                "id": idlist,
                "model": "list",
                "sections": [
                    {
                        "title": "",
                        "rows": rows
                    }
                ],
                "auto": auto,
                "btext": btext,
                "text": text
            }
        ), null, 2)
        toastr.success('Message has been Sent');
    });
    $('#add-webhook').click(function (e) { 
        e.preventDefault();
        const uri = $('#input-webhook').val();
        ws.send(JSON.stringify({
            type: 'update-data',
            data: {
                webhook: uri
            }
        }))
        toastr.success('Webhook has been Added, Please Refresh Page');
        $('#add-webhook').hide();
        $('#remove-webhook').show();
    });
    $('#remove-webhook').click(function (e) { 
        e.preventDefault();
        ws.send(JSON.stringify({
            type: 'update-data',
            data: {
                webhook: null
            }
        }))
        toastr.success('Webhook has been Remove, Please Refresh Page');
        $('#add-webhook').show();
        $('#remove-webhook').hide();
    });
}