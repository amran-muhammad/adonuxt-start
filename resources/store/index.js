export const strict = false

export const state = () => ({
    authUser: false,
    productCategory: []
})

export const getters = {
    getProductCategory(state) {
        return state.productCategory
    }
}

export const mutations = {
    
    setProductCategory(state, data) {
        state.productCategory = data
    }
}



// actionns for commiting mutations
export const actions = {

    async nuxtServerInit({ commit }, { $axios }) {
        // try {
        //   // get the initial data
        //   let { data } = await $axios.get('/app/user/initData')
        //   // console.log('nuxtServerinit')
        //   // console.log(data)
        //   // update the state of the aiuth
        //   if (data) {
        //     commit('updateAuthUser', data)
        //   }
        //   // console.log(data)
        // } catch (e) {
        //   console.log(e.response)
        // }
    },

    // loginUser({ commit }, data) {
    //   commit('updateAuthUser', data)
    // }

    // async logout({ commit, redirect }) {
    //     try {
    //         let { data } = await this.$axios.get('app/logout')
    //         // update the state of the aiuth
    //         commit('updateAuthUser', false)
    //         this.$router.push('/app/login')
    //     } catch (e) {
    //         console.log(e)
    //     }
    // }
}
