import { login, logout, getInfo } from '@/api/auth'
import tokenManage from '@/utils/tokenManage'
import { resetRouter } from '@/router'

const state = {
  tenant: null,
  token: tokenManage.getToken(),
  user: {},
  username: null,
  roles: [],
  permissions: []
}

const mutations = {
  SET_TENANT: (state, tenant) => {
    state.tenant = tenant
  },
  SET_TOKEN: (state, token) => {
    state.token = token
  },
  SET_USERNAME: (state, username) => {
    state.username = username
  },
  SET_USER: (state, user) => {
    state.user = user
  },
  SET_ROLES: (state, roles) => {
    state.roles = roles
  },
  SET_PERMISSIONS: (state, permissions) => {
    state.permissions = permissions
  }
}

const actions = {
  // 登录
  login({ commit }, userInfo) {
    const { username, password } = userInfo
    return new Promise((resolve, reject) => {
      login({ username: username.trim(), password: password }).then(response => {
        const { data } = response
        commit('SET_TOKEN', data.accessToken)
        tokenManage.setToken(data.accessToken)
        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },
  // 获取用户信息
  getInfo({ commit, state }) {
    return new Promise((resolve, reject) => {
      getInfo().then(response => {
        const { data } = response

        if (!data) {
          reject('Verification failed, please Login again.')
        }

        const { roles, info, permissions } = data
        if (!roles || roles.length <= 0) {
          reject('getInfo: roles must be a non-null array!')
        }

        commit('SET_PERMISSIONS', permissions.map(role => role.permission))
        commit('SET_ROLES', roles.map(role => role.roleCode))
        commit('SET_USERNAME', info.username)
        // 获取最高角色级别
        info.level = roles.map(role => role.level).reduce((pre, next) => pre > next ? next : pre)
        commit('SET_USER', info)

        resolve(data)
      }).catch(error => {
        reject(error)
      })
    })
  },
  // 登出
  logout({ commit, state, dispatch }) {
    return new Promise((resolve, reject) => {
      logout(state.token).then(() => {
        commit('SET_TOKEN', '')
        commit('SET_ROLES', [])
        commit('SET_PERMISSIONS', [])

        tokenManage.removeToken()
        resetRouter()

        dispatch('tagsView/delAllViews', null, { root: true })

        resolve()
      }).catch(error => {
        reject(error)
      })
    })
  },
  // 重置token
  resetToken({ commit }) {
    return new Promise(resolve => {
      commit('SET_TOKEN', '')
      commit('SET_ROLES', [])
      commit('SET_PERMISSIONS', [])
      tokenManage.removeToken()
      resolve()
    })
  }
}

export default {
  namespaced: true,
  state,
  mutations,
  actions
}
