'use strict'
const Route = use('Route')

// all users
Route.get('/app/user/get/user', 'UserController.getAllUser')
Route.post('/app/user/delete/user', 'UserController.deleteUser')


