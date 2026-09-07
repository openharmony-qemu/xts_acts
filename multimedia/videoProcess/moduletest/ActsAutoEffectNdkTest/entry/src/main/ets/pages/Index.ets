import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libautoeffecttest.so';

const DOMAIN = 0x0000;

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @StorageLink('xComponentReady') xComponentReady: boolean = false;
  private xComponentNameId: string = '';

  aboutToAppear() {
    this.xComponentNameId = testNapi.GetXComponentNameId();
    testNapi.setReadyCallback((ready: boolean) => {
      hilog.info(DOMAIN, 'setReadyCallback', 'xComponentReady=%{public}s', String(ready));
      AppStorage.setOrCreate('xComponentReady', ready);
    });
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize($r('app.float.page_text_font_size'))
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.message = 'Welcome';
          })
        if (this.xComponentReady) {
          XComponent({
            id: this.xComponentNameId,
            type: XComponentType.SURFACE,
            libraryname: 'autoeffecttest'
          })
            .width('100%')
            .height('100%')
            .onLoad(() => {
              hilog.info(DOMAIN, 'XComponent', 'onLoad surfaceReady=true');
              testNapi.notifySurfaceReady();
            })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}
