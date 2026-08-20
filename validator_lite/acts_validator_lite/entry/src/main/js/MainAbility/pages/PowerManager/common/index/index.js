import router from '@system.router';

export default {
  data: {
    itemIndex: 0,
    todolist: [
      { id: 0, title: 'battery', url: 'pages/PowerManager/battery/index' },
      { id: 1, title: 'brightness(value)', url: 'pages/PowerManager/brightness/value/index' },
      { id: 2, title: 'brightness(mode)', url: 'pages/PowerManager/brightness/mode/index' },
      { id: 3, title: '返回首页', url: 'pages/index/index' }
    ]
  },
  onShow() {
    this.$refs.list.scrollTo({index: this.itemIndex});
  },
  clickChange(item) {
    router.replace({ uri: item.url, params: { itemIndex: item.id } });
  },
  swipeEvent(e) {
    if (e.direction === 'right') {
      router.replace({ uri: 'pages/index/index' });
    }
  },
};
