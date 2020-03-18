'use strict'
const User = use('App/Models/User')


class UserController {
    //all order getAllUser
    async getAllUser({ request, response }) {
        let page = request.input('page') ? request.input('page') : 1;
         return User.query().orderBy('id','desc').paginate(page,1)
     }
     async deleteUser({ request, response }) {
        let data = request.body
        return User.query().where('id',data.id).delete()  
       }


    
}

module.exports = UserController
