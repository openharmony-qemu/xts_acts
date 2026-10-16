import router from '@system.router';

export default {
  data: {
    itemIndex: 0,
    todolist: [
      { id: 0, title: 'ui basic', url: 'pages/ArkUI/ui_basic/index' },
      { id: 1, title: 'ui advanced', url: 'pages/ArkUI/ui_advanced/index' },
      { id: 8, title: 'chart(line)', url: 'pages/ArkUI/chart/line/index' },
      { id: 14, title: 'marquee', url: 'pages/ArkUI/marquee/index' },
      { id: 15, title: 'element-transition', url: 'pages/ArkUI/element-transition/index' },
      { id: 16, title: 'pathAnimator', url: 'pages/ArkUI/pathAnimator/index' },
      { id: 17, title: 'gradient(direction)', url: 'pages/ArkUI/gradient_direction/index' },
      { id: 18, title: 'gradient(angle)', url: 'pages/ArkUI/gradient_angle/index' },
      { id: 19, title: 'gradient(button)', url: 'pages/ArkUI/gradient_button/index' },
      { id: 20, title: 'gradient(list)', url: 'pages/ArkUI/gradient_list/index' },
      { id: 21, title: 'flex aspect-ratio', url: 'pages/ArkUI/flex/aspect-ratio/index' },
      { id: 22, title: 'flex item sizing', url: 'pages/ArkUI/flex/item-sizing/index' },
      { id: 23, title: 'flex align-self', url: 'pages/ArkUI/flex/align-self/index' },
      { id: 24, title: 'flex size constraints', url: 'pages/ArkUI/flex/size-constraints/index' },
      { id: 25, title: 'flex align-content', url: 'pages/ArkUI/flex/align-content/index' },
      { id: 26, title: 'flex direction', url: 'pages/ArkUI/flex/flexDirection/index' },
      { id: 27, title: 'flex justify-content', url: 'pages/ArkUI/flex/justifyContent/index' },
      { id: 28, title: 'flex align-items', url: 'pages/ArkUI/flex/alignItems/index' },
      { id: 29, title: 'flex wrap', url: 'pages/ArkUI/flex/flexWrap/index' },
      { id: 30, title: 'flex gap', url: 'pages/ArkUI/flex/flex-gap/index' },
      { id: 31, title: 'flex margin-left', url: 'pages/ArkUI/flex/flex-margin-left/index' },
      { id: 32, title: 'flex overflow', url: 'pages/ArkUI/flex/flex-overflow/index' },
      { id: 33, title: 'flex position', url: 'pages/ArkUI/flex/flex-position/index' },
      { id: 34, title: 'transition_basic', url: 'pages/ArkUI/transition_basic/index' },
      { id: 35, title: 'svgShape', url: 'pages/ArkUI/svgShape/index' },
      { id: 36, title: 'svgPath', url: 'pages/ArkUI/svgPath/index' },
      { id: 37, title: 'svgPaint', url: 'pages/ArkUI/svgPaint/index' },
      { id: 38, title: 'svgTransform', url: 'pages/ArkUI/svgTransform/index' },
      { id: 39, title: 'svgText', url: 'pages/ArkUI/svgText/index' },
      { id: 40, title: 'svgAnimate', url: 'pages/ArkUI/svgAnimate/index' },
      { id: 42, title: 'Router Transition', url: 'pages/ArkUI/RouterTransition/index/index' },
      { id: 41, title: '返回首页', url: 'pages/index/index' }
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
