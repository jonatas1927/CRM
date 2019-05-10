import axios from 'axios'
export async function Request(config) {
  return axios({
    method: config.method || "POST",
    url: config.url || 'http://localhost:3000/graphiql',
    data: config.data
  });
}
