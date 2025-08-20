import { Entry, Text, Column, Component, Button, ClickEvent, TextController,
  TextStyle, StyledString, Color, FontWeight, FontStyle } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { i18n } from '@kit.LocalizationKit';
import hilog from '@ohos.hilog'

@Entry
@Component
struct MyStateSample {
  integerTextStyle = new TextStyle({
    fontColor: Color.Red,
    fontFamily: "Arial",
    fontWeight: FontWeight.Lighter,
    fontStyle: FontStyle.Italic
  });
  decimalTextStyle = new TextStyle({
    fontColor: Color.Black,
    fontFamily: "Arial",
    fontWeight: FontWeight.Normal,
    fontStyle: FontStyle.Normal
  });
  fractionTextStyle = new TextStyle({
    fontColor: Color.Green,
    fontFamily: "Arial",
    fontWeight: FontWeight.Regular,
    fontStyle: FontStyle.Normal
  });
  unitTextStyle = new TextStyle({
    fontColor: Color.Blue,
    fontFamily: "Arial",
    fontWeight: FontWeight.Medium,
    fontStyle: FontStyle.Italic
  });
  numberFormat = new Intl.NumberFormat('en-GB', {
    style: 'currency',
    currency: 'EUR',
    currencyDisplay: 'name',
    currencySign: 'accounting',
    signDisplay: 'always'
  });
  styledNumberFormat = new i18n.StyledNumberFormat(this.numberFormat, {
    integer: this.integerTextStyle,
    decimal: this.decimalTextStyle,
    fraction:this.fractionTextStyle,
    unit: this.unitTextStyle
  });
  @State html : string = StyledString.toHtml(this.styledNumberFormat.format(123456.789));


  build() {
    Column() {
      Text(this.html).id('i18nStageStaticText').height('10%')
    }
  }
}
