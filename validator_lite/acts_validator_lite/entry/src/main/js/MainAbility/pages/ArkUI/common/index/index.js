import router from '@system.router';

export default {
  data: {
    itemIndex: 0,
    todolist: [
      { id: 0, title: 'text', url: 'pages/ArkUI/text/index' },
      { id: 2, title: 'image', url: 'pages/ArkUI/image/index' },
      { id: 3, title: 'progress', url: 'pages/ArkUI/progress/index' },
      { id: 4, title: 'slider', url: 'pages/ArkUI/slider/index' },
      { id: 5, title: 'switch', url: 'pages/ArkUI/switch/index' },
      { id: 7, title: 'chart(bar)', url: 'pages/ArkUI/chart/bar/index' },
      { id: 8, title: 'chart(line)', url: 'pages/ArkUI/chart/line/index' },
      { id: 9, title: 'image-animator', url: 'pages/ArkUI/image-animator/index' },
      { id: 10, title: 'input', url: 'pages/ArkUI/input/index' },
      { id: 11, title: 'list-item', url: 'pages/ArkUI/list-item/index' },
      { id: 12, title: 'longpress', url: 'pages/ArkUI/event/longpress/index' },
      { id: 13, title: 'swipe(event)', url: 'pages/ArkUI/event/swipe/index' },
      { id: 14, title: 'marquee', url: 'pages/ArkUI/marquee/index' },
      { id: 15, title: 'opacity', url: 'pages/ArkUI/opacity/index' },
      { id: 16, title: 'picker-view', url: 'pages/ArkUI/picker-view/index' },
      { id: 17, title: 'qrcode', url: 'pages/ArkUI/qrcode/index' },
      { id: 18, title: 'swiper', url: 'pages/ArkUI/swiper/index' },
      { id: 19, title: 'transition', url: 'pages/ArkUI/transition/index' },
      { id: 21, title: 'app', url: 'pages/ArkUI/app/index' },
      { id: 22, title: 'configuration', url: 'pages/ArkUI/configuration/index' },
      { id: 23, title: 'timer(timeout)', url: 'pages/ArkUI/timer/timeout/index' },
      { id: 24, title: 'timer(interval)', url: 'pages/ArkUI/timer/interval/index' },
      { id: 25, title: '返回首页', url: 'pages/index/index' }
    ]
  },

  onShow() {
    this.$refs.list.scrollTo({index: this.itemIndex});
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
