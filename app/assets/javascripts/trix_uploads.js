Trix.config.attachments.preview.caption = {
  name: false,
  size: false,
}

function uploadAttachment(attachment) {
  const file = attachment.file
  const form = new FormData

  form.append('Content-Type', file.type)
  form.append('image[image]', file)

  const xhr = new XMLHttpRequest
  xhr.open('POST', '/images.json', true)
  xhr.setRequestHeader('X-CSRF-Token', Rails.csrfToken())

  xhr.upload.onprogress = event => {
    const progress = event.loaded / event.total * 100
    attachment.setUploadProgress(progress)
  }

  xhr.onload = () => {
    if (xhr.status === 201) {
      const data = JSON.parse(xhr.responseText)
      return attachment.setAttributes({
        url: data.image_url,
        href: data.image_url,
      })
    }
  }

  return xhr.send(form)
}

document.addEventListener('trix-attachment-add', event => {
  const attachment = event.attachment
  if (attachment.file) {
    return uploadAttachment(attachment)
  }
})
