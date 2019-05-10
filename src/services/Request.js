import axios from 'axios'
export async function Request(config) {
  return axios({
    method: config.method || "post",
    url: config.url || 'http://localhost:3000/graphql',
    data: config.data
  });
}
