import router from '@system.router';

export default {
  data: {
    step: '',
    result: '',
    backUrl: ''
  },
  onShow() {
    let helpData = getApp().data.helpData;
    if (helpData) {
      this.step = helpData.step || '';
      this.result = helpData.result || '';
      this.backUrl = helpData.url || 'pages/index/index';
    }
  },
  back() {
    router.replace({ uri: this.backUrl });
  }
}
