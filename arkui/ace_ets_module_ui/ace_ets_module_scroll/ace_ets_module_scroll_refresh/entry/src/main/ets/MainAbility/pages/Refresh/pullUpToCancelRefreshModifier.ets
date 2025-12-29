// xxx.ets
class CustomModifier implements AttributeModifier<RefreshAttribute> {
  public changeIndex: number = 0;
  public changeList:(boolean|undefined|null)[]=[
    true,
    false,
    undefined,
    null
  ]
  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.pullUpToCancelRefresh(this.changeList[this.changeIndex])
  }
}


@Entry
@Component
struct RefreshModifierExample {
  @State isRefreshing: boolean = true;
  @State promptText: string = 'Refreshing...';
  @State arr: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  @State modifier:CustomModifier = new CustomModifier()

  build() {
    Column() {
      Button('true')
        .onClick(() => {
          this.modifier.changeIndex = 0;
        })
        .id('valueTrueM')
      Button('false')
        .onClick(() => {
          this.modifier.changeIndex = 1;
        })
        .id('valueFalseM')
      Button('unde')
        .onClick(() => {
          this.modifier.changeIndex = 2;
        })
        .id('valueUndeM')
      Button('null')
        .onClick(() => {
          this.modifier.changeIndex = 3;
        })
        .id('valueNullM')
      Refresh({ refreshing: $$this.isRefreshing, promptText: this.promptText }) {
        List() {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text(item)
                .width('70%')
                .height(80)
                .fontSize(16)
                .margin(10)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xFFFFFF)
            }
          }, (item: string) => item)
        }
        .onScrollIndex((first: number) => {
          console.info(first.toString());
        })
        .width('100%')
        .height('100%')
        .alignListItem(ListItemAlign.Center)
        .scrollBar(BarState.Off)
      }
      .id('noRefreshModifier')
      .backgroundColor(0x89CFF0)
      .pullToRefresh(true)
      .attributeModifier(this.modifier as CustomModifier )
      .refreshOffset(296)
      .pullDownRatio(0.9)
      .onStateChange((refreshStatus: RefreshStatus) => {
        console.info('Refresh onStatueChange state is ' + refreshStatus);
      })
      .onOffsetChange((value: number) => {
        console.info('Refresh onOffsetChange offset:' + value);
      })
      .onRefreshing(() => {
        setTimeout(() => {
          this.isRefreshing = false;
        }, 6000)
        console.info('onRefreshing test');
      })
    }
  }
}