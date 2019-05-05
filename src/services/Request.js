import axios from 'axios'
export async function Request(config) {
  return axios({
    method: config.method || "POST",
    url: config.url,
    data: config.data
  });
}
