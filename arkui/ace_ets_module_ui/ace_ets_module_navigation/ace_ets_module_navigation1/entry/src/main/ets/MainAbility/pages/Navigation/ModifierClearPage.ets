class ModifierClear implements AttributeModifier<NavigationAttribute> {
  public enableClear: boolean = true;

  public applyNormalAttribute(nav: NavigationAttribute) {
    nav.configuration({
      clearContentStackOnPrimaryNavigation: this.enableClear
    })
  }
}

@Entry
@Component
struct ModifierClearPage {
  @Provide('navPathStack') navPathStack: NavPathStack = new NavPathStack();
  @State myModifier: ModifierClear = new ModifierClear();

  @Builder
  PageMap(name: string, param: Object) {
    if (name === 'pageA') {
      PageAModifier()
    } else if (name === 'pageB') {
      PageBModifier()
    }
  }

  aboutToAppear() {
    AppStorage.setOrCreate<NavPathStack>('navPathStack', this.navPathStack);
  }

  build() {
    Navigation(this.navPathStack) {
      Column() {
        Row() {
          Button('modifier_clear_true')
            .id('modifier_clear_true')
            .onClick(() => {
              this.myModifier.enableClear = true;
            })
            .margin(5)

          Button('modifier_clear_false')
            .id('modifier_clear_false')
            .onClick(() => {
              this.myModifier.enableClear = false;
            })
            .margin(5)
        }

        Button('modifier_push_pageA')
          .id('modifier_push_pageA')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageA' });
          })
          .margin(5)

        Button('modifier_push_pageB')
          .id('modifier_push_pageB')
          .onClick(() => {
            this.navPathStack.pushPath({ name: 'pageB' });
          })
          .margin(5)

        Button('modifier_pop')
          .id('modifier_pop')
          .onClick(() => {
            this.navPathStack.pop();
          })
          .margin(5)

        Button('modifier_clear')
          .id('modifier_clear')
          .onClick(() => {
            this.navPathStack.clear();
          })
          .margin(5)
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .title('ModifierClear')
    .navDestination(this.PageMap)
    .mode(NavigationMode.Stack)
    .attributeModifier(this.myModifier)
  }
}

@Component
struct PageAModifier {
  build() {
    NavDestination() {
      Column() {
        Text('PageA Modifier')
          .id('pageAModifierText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('PageA')
  }
}

@Component
struct PageBModifier {
  build() {
    NavDestination() {
      Column() {
        Text('PageB Modifier')
          .id('pageBModifierText')
          .fontSize(20)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .title('PageB')
  }
}
