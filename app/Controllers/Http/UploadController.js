'use strict'
const Helpers = use('Helpers')
const Drive = use('Drive')
const Env = use('Env')
class UploadController {

  async uploadProductImage({ request, response }) {


    // ************* first way ***************************************************
    // const validationOptions = {
    //     types: ['jpeg', 'jpg', 'png'],
    //     size: '5mb'
    //   }

    //   request.multipart.file('file', validationOptions, async f => {
    //     // set file size from stream byteCount, so adonis can validate file size
    //     // f.size = f.stream.byteCount

    //     // // run validation rules
    //     // await f.runValidations()

    //     // // catches validation errors, if any and then throw exception
    //     // const error = f.error()
    //     // if (error.message) {
    //     //   throw new Error(error.message)
    //     // }

    //     // upload file to s3
    //     await Drive.put(`test/${f.clientName}`, f.stream, {
    //       ContentType: 'image/jpeg',
    //       ACL: 'public-read'
    //     })
    //   })

    //   // You must call this to start processing uploaded file
    //   await request.multipart.process()

    //   return 'done'


    // ************* second way **************************************
    // const folder = 'test';

    // request.multipart.file('avatar', {}, async file => {
    //   await Drive.put(`${folder}/${file.clientName}`, file.stream, {
    //     ACL: 'public-read',
    //     ContentType: `${file.type}/${file.subtype}`,
    //   });
    // });

    // await request.multipart.process();

    // return 'File saved to S3.';


    // ********************** local file upload ************************
    const avatar = request.file('avatar', {
      types: ['image'],
      size: '20mb'
    })
    if (avatar) {
      const type = avatar.toJSON().subtype;
      const name = `image_${new Date().getTime()}.${type}`
      // UPLOAD THE IMAGE TO UPLOAD FOLDER 
      await avatar.move(Helpers.publicPath('uploads'), {
        name: name
      })

      if (!avatar.moved()) {
        console.log('error')
        return avatar.error()
      }

      let siteUrl = Env.get('SITE_URL')
      return response.status(200).json({
        message: 'File has been uploaded successfully!',
        file: `${siteUrl}/uploads/${name}`
      })
    }

    return response.status(200).json({
      message: 'Invalid Request!',
      file: ``
    })

  }
}

module.exports = UploadController
