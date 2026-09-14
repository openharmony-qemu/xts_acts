import router from '@system.router';

export default {
  data: {
    itemIndex: 0,
    todolist: [
      { id: 0, title: 'ui basic', url: 'pages/ArkUI/ui_basic/index' },
      { id: 1, title: 'ui advanced', url: 'pages/ArkUI/ui_advanced/index' },
      { id: 8, title: 'chart(line)', url: 'pages/ArkUI/chart/line/index' },
      { id: 14, title: 'marquee', url: 'pages/ArkUI/marquee/index' },
      { id: 25, title: '返回首页', url: 'pages/index/index' }
    ]
  },

  onShow() {
  },

  clickChange(item) {
    router.replace({
      uri: item.url,
      params: {
        itemIndex: item.id
      }
    });
  },

  swipeEvent(e) {
    if (e.direction === 'right') {
      router.replace({ uri: 'pages/index/index' });
    }
  },
};
