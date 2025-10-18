/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
*     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { attrsManager } from '../../common/AttrsManager'
import router from '@ohos.router'
import { Entry, Component, Row, Text, Color, Column, Scroller, CanvasRenderingContext2D, RenderingContextSettings,
  AlphabetIndexer, Button, Blank, Checkbox, CheckboxGroup, DataPanel, DatePicker, Divider, Gauge, Image, ImageAnimator,
  LoadingProgress, Marquee, Navigation, Menu, $r, MenuItem, QRCode, Radio, Rating, ScrollBar, Select, MenuItemOptions,
  Slider, Stepper, TextArea, TextClock, TextInput, TextPicker, TimePicker, Toggle, Web, Circle, Ellipse, Line, WebviewController,
  Polyline, Polygon, Path, Rect, Shape, Badge, ColumnSplit, Counter, Flex, GridRow, Grid, List, Refresh, ProgressType, FlowItem,
  RelativeContainer, RowSplit, Scroll, SideBarContainer, Stack, Swiper, Tabs, WaterFlow, CalendarPicker,
  FormLink, Hyperlink, Progress, BarState, Search, SliderStyle, StepperItem, TextTimer, ToggleType, TextAlign,
  GridRowDirection, ForEach, ListItem, ListItemGroup, VerticalAlign, HorizontalAlign, SideBarContainerType, FlexAlign,
  TabContent, GridCol, GridItem, MenuItemGroup, Canvas, Span, AttributeModifier, AlphabetIndexerAttribute, BadgeAttribute, ButtonAttribute,
  BlankAttribute, CalendarPickerAttribute, CanvasAttribute, CheckboxAttribute, CheckboxGroupAttribute, CircleAttribute,
  ColumnAttribute, ColumnSplitAttribute, CounterAttribute, DataPanelAttribute, DatePickerAttribute, DividerAttribute,
  EllipseAttribute, FlexAttribute, FlowItemAttribute, FormLinkAttribute, GaugeAttribute, GridAttribute, GridColAttribute,
  GridItemAttribute, GridRowAttribute, HyperlinkAttribute, ImageAttribute, ImageAnimatorAttribute, LineAttribute, ListAttribute,
  ListItemAttribute, ListItemGroupAttribute, LoadingProgressAttribute, MarqueeAttribute, MenuAttribute, MenuItemAttribute,
  MenuItemGroupAttribute, NavDestinationAttribute, NavigationAttribute, PathAttribute, PolygonAttribute, PolylineAttribute,
  ProgressAttribute, QRCodeAttribute, RadioAttribute, RatingAttribute, RectAttribute, RefreshAttribute, RelativeContainerAttribute,
  RemoteWindowAttribute, RichEditorAttribute, RichTextAttribute, RowAttribute, RowSplitAttribute, ScrollAttribute, ScrollBarAttribute,
  SearchAttribute, SelectAttribute, ShapeAttribute, SliderAttribute, SpanAttribute, StackAttribute, StepperAttribute,
  StepperItemAttribute, SwiperAttribute, SideBarContainerAttribute, ToggleAttribute, TabContentAttribute, TabsAttribute,
  TextAttribute, TextAreaAttribute, TextClockAttribute, TextInputAttribute, TextPickerAttribute, TextTimerAttribute,
  TimePickerAttribute, VideoAttribute, WaterFlowAttribute, WebAttribute, WindowSceneAttribute, XComponentAttribute,
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, EffectComponentAttribute, FormComponentAttribute,
  ImageSpanAttribute, PatternLockAttribute, PluginComponentAttribute, UIExtensionComponentAttribute } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { attrsManager } from '../../common/AttrsManager';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}














class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class StepperModifier implements AttributeModifier<StepperAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: StepperAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: StepperItemAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mUseEffect: boolean = true
  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`useEffect page show ${JSON.stringify(this.mUseEffect)}`)
   instance.useEffect(this.mUseEffect)
  }
}

@Entry
@Component
struct useEffectPage {
  @State _useEffect: boolean = false
  @State _useEffectAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _useEffectBadgeMod: BadgeModifier = new BadgeModifier()
  @State _useEffectBlankMod: BlankModifier = new BlankModifier()
  @State _useEffectButttonMod: ButtonModifier = new ButtonModifier()
  @State _useEffectCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _useEffectCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _useEffectCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _useEffectColumnMod: ColumnModifier = new ColumnModifier()
  @State _useEffectColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _useEffectCounterMod: CounterModifier = new CounterModifier()
  @State _useEffectDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _useEffectDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _useEffectDividerMod: DividerModifier = new DividerModifier()
  @State _useEffectEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _useEffectFlexMod: FlexModifier = new FlexModifier()
  @State _useEffectFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _useEffectFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _useEffectFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _useEffectGaugeMod: GaugeModifier = new GaugeModifier()
  @State _useEffectGridMod: GridModifier = new GridModifier()
  @State _useEffectGridColMod: GridColModifier = new GridColModifier()
  @State _useEffectGridItemMod: GridItemModifier = new GridItemModifier()
  @State _useEffectGridRowMod: GridRowModifier = new GridRowModifier()
  @State _useEffectHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _useEffectImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _useEffectImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _useEffectImageMod: ImageModifier = new ImageModifier()
  @State _useEffectListMod: ListModifier = new ListModifier()
  @State _useEffectListItemMod: ListItemModifier = new ListItemModifier()
  @State _useEffectListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _useEffectLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _useEffectMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _useEffectMenuMod: MenuModifier = new MenuModifier()
  @State _useEffectMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _useEffectMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _useEffectNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  
  @State _useEffectNavigationMod: NavigationModifier = new NavigationModifier()
  
  @State _useEffectPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _useEffectPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _useEffectQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _useEffectRadioMod: RadioModifier = new RadioModifier()
  @State _useEffectRatingMod: RatingModifier = new RatingModifier()
  @State _useEffectRefreshMod: RefreshModifier = new RefreshModifier()
  @State _useEffectRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _useEffectRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _useEffectRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _useEffectRichTextMod: RichTextModifier = new RichTextModifier()
  @State _useEffectRowMod: RowModifier = new RowModifier()
  @State _useEffectRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _useEffectScrollMod: ScrollModifier = new ScrollModifier()
  @State _useEffectScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _useEffectSearchMod: SearchModifier = new SearchModifier()
  @State _useEffectSelectMod: SelectModifier = new SelectModifier()
  @State _useEffectSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _useEffectSliderMod: SliderModifier = new SliderModifier()
  @State _useEffectStackMod: StackModifier = new StackModifier()
  @State _useEffectStepperMod: StepperModifier = new StepperModifier()
  @State _useEffectStepperItemMod: StepperItemModifier = new StepperItemModifier()
  @State _useEffectSwiperMod: SwiperModifier = new SwiperModifier()
  @State _useEffectTabContentMod: TabContentModifier = new TabContentModifier()
  @State _useEffectTabsMod: TabsModifier = new TabsModifier()
  @State _useEffectTextMod: TextModifier = new TextModifier()
  @State _useEffectTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _useEffectTextClockMod: TextClockModifier = new TextClockModifier()
  @State _useEffectTextInputMod: TextInputModifier = new TextInputModifier()
  @State _useEffectTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _useEffectTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _useEffectTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _useEffectToggleMod: ToggleModifier = new ToggleModifier()
  @State _useEffectUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _useEffectWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _useEffectWebMod: WebModifier = new WebModifier()
  @State _useEffectXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView ?? '';
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey ?? '';
  @State parentWidth: double = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
  @State parentHeight: double = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
  @State columns: int = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int) ?? 0
  @State gutter: int = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int) ?? 0
  @State parentComponentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey ?? '';

  onPageShow() {
    console.info('22222 useEffect page show called ')
    attrsManager.registerDataChange((value: SetValue) => {
      console.info('22222 [registerDataChange] ' + JSON.stringify(value.useEffect))
      this._useEffectAlphabetIndexerMod.mUseEffect = value.useEffect
      this._useEffectBadgeMod.mUseEffect = value.useEffect
      this._useEffectBlankMod.mUseEffect = value.useEffect
      this._useEffectButttonMod.mUseEffect = value.useEffect
      this._useEffectCalendarPickerMod.mUseEffect = value.useEffect
      this._useEffectCheckboxMod.mUseEffect = value.useEffect
      this._useEffectCheckboxGroupMod.mUseEffect = value.useEffect
      this._useEffectColumnMod.mUseEffect = value.useEffect
      this._useEffectColumnSplitMod.mUseEffect = value.useEffect
      this._useEffectCounterMod.mUseEffect = value.useEffect
      this._useEffectDataPanelMod.mUseEffect = value.useEffect
      this._useEffectDatePickerMod.mUseEffect = value.useEffect
      this._useEffectDividerMod.mUseEffect = value.useEffect
      this._useEffectEffectComponentMod.mUseEffect = value.useEffect
      this._useEffectFlexMod.mUseEffect = value.useEffect
      this._useEffectFlowItemMod.mUseEffect = value.useEffect
      this._useEffectFormComponentMod.mUseEffect = value.useEffect
      this._useEffectFormLinkMod.mUseEffect = value.useEffect
      this._useEffectGaugeMod.mUseEffect = value.useEffect
      this._useEffectGridMod.mUseEffect = value.useEffect
      this._useEffectGridColMod.mUseEffect = value.useEffect
      this._useEffectGridItemMod.mUseEffect = value.useEffect
      this._useEffectGridRowMod.mUseEffect = value.useEffect
      this._useEffectHyperlinkMod.mUseEffect = value.useEffect
      this._useEffectImageAnimatorMod.mUseEffect = value.useEffect
      this._useEffectImageSpanMod.mUseEffect = value.useEffect
      this._useEffectImageMod.mUseEffect = value.useEffect
      this._useEffectListMod.mUseEffect = value.useEffect
      this._useEffectListItemMod.mUseEffect = value.useEffect
      this._useEffectListItemGroupMod.mUseEffect = value.useEffect
      this._useEffectLoadingProgressMod.mUseEffect = value.useEffect
      this._useEffectMarqueeMod.mUseEffect = value.useEffect
      this._useEffectMenuMod.mUseEffect = value.useEffect
      this._useEffectMenuItemMod.mUseEffect = value.useEffect
      this._useEffectMenuItemGroupMod.mUseEffect = value.useEffect
      this._useEffectNavDestinationMod.mUseEffect = value.useEffect
      
      this._useEffectNavigationMod.mUseEffect = value.useEffect
      
      this._useEffectPatternLockMod.mUseEffect = value.useEffect
      this._useEffectPluginComponentMod.mUseEffect = value.useEffect
      this._useEffectQRCodeMod.mUseEffect = value.useEffect
      this._useEffectRadioMod.mUseEffect = value.useEffect
      this._useEffectRatingMod.mUseEffect = value.useEffect
      this._useEffectRefreshMod.mUseEffect = value.useEffect
      this._useEffectRelativeContainerMod.mUseEffect = value.useEffect
      this._useEffectRemoteWindowMod.mUseEffect = value.useEffect
      this._useEffectRichEditorMod.mUseEffect = value.useEffect
      this._useEffectRichTextMod.mUseEffect = value.useEffect
      this._useEffectRowMod.mUseEffect = value.useEffect
      this._useEffectRowSplitMod.mUseEffect = value.useEffect
      this._useEffectScrollMod.mUseEffect = value.useEffect
      this._useEffectScrollBarMod.mUseEffect = value.useEffect
      this._useEffectSearchMod.mUseEffect = value.useEffect
      this._useEffectSelectMod.mUseEffect = value.useEffect
      this._useEffectSideBarContainerMod.mUseEffect = value.useEffect
      this._useEffectSliderMod.mUseEffect = value.useEffect
      this._useEffectStackMod.mUseEffect = value.useEffect
      this._useEffectStepperMod.mUseEffect = value.useEffect
      this._useEffectStepperItemMod.mUseEffect = value.useEffect
      this._useEffectSwiperMod.mUseEffect = value.useEffect
      this._useEffectTabContentMod.mUseEffect = value.useEffect
      this._useEffectTabsMod.mUseEffect = value.useEffect
      this._useEffectTextMod.mUseEffect = value.useEffect
      this._useEffectTextAreaMod.mUseEffect = value.useEffect
      this._useEffectTextClockMod.mUseEffect = value.useEffect
      this._useEffectTextInputMod.mUseEffect = value.useEffect
      this._useEffectTextPickerMod.mUseEffect = value.useEffect
      this._useEffectTextTimerMod.mUseEffect = value.useEffect
      this._useEffectTimePickerMod.mUseEffect = value.useEffect
      this._useEffectToggleMod.mUseEffect = value.useEffect
      this._useEffectUIExtensionComponentMod.mUseEffect = value.useEffect
      this._useEffectWaterFlowMod.mUseEffect = value.useEffect
      this._useEffectWebMod.mUseEffect = value.useEffect
      this._useEffectXComponentMod.mUseEffect = value.useEffect
  
    })
  }

  
  
  
  
  
  

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').attributeModifier(this._useEffectButttonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').attributeModifier(this._useEffectTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .attributeModifier(this._useEffectAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).attributeModifier(this._useEffectBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().attributeModifier(this._useEffectCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).attributeModifier(this._useEffectCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .attributeModifier(this._useEffectDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).attributeModifier(this._useEffectDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().attributeModifier(this._useEffectDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .attributeModifier(this._useEffectGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).attributeModifier(this._useEffectImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).attributeModifier(this._useEffectImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().attributeModifier(this._useEffectLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).attributeModifier(this._useEffectMarqueeMod)
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).attributeModifier(this._useEffectMenuMod)
        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
          
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').attributeModifier(this._useEffectQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).attributeModifier(this._useEffectRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).attributeModifier(this._useEffectRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.attributeModifier(this._useEffectScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().attributeModifier(this._useEffectSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).attributeModifier(this._useEffectSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .attributeModifier(this._useEffectSliderMod)
        } else if (this.targetView == 'Stepper') {
          Stepper() {
            StepperItem() {
              Column() {
                Text('Page One')
              }
            }
          }
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).attributeModifier(this._useEffectTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .attributeModifier(this._useEffectTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .attributeModifier(this._useEffectTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).attributeModifier(this._useEffectTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .attributeModifier(this._useEffectToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
          .attributeModifier(this._useEffectWebMod)
        } else if (this.targetView == 'Circle') {
          Circle()
        } else if (this.targetView == 'Ellipse') {
          Ellipse()
        } else if (this.targetView == 'Line') {
          Line()
            
            .startPoint([0, 0])
            .endPoint([50, 100])
            .backgroundColor(Color.Black)
        } else if (this.targetView == 'Polyline') {
          Polyline()
        } else if (this.targetView == 'Polygon') {
          Polygon()
        } else if (this.targetView == 'Path') {
          Path()
        } else if (this.targetView == 'Rect') {
          Rect()
        } else if (this.targetView == 'Shape') {
          Shape() {
            Rect().width(100).height(50)
          }
        } else if (this.targetView == 'Badge') {
          Badge({
            count: 50,
            style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
          } as BadgeParamWithNumber) {
            Button('message')
              .width(100).height(50).backgroundColor(0x317aff)
          }.attributeModifier(this._useEffectBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.attributeModifier(this._useEffectColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.attributeModifier(this._useEffectColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.attributeModifier(this._useEffectCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.attributeModifier(this._useEffectFlexMod)
        } else if (this.targetView == 'GridRow') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green,
            Color.Pink, Color.Grey, Color.Blue, Color.Brown], (color:Color) => {
              GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
                Row().width('100%').height('20vp')
              }.borderColor(color).borderWidth(2)
            })
          }.attributeModifier(this._useEffectGridRowMod)
        } else if (this.targetView == 'Grid') {
          Grid() {
            ForEach(['0', '1', '2', '3', '4'], (item: string) => {
              ForEach(['0', '1', '2', '3', '4'], (day: string) => {
                GridItem() {
                  Text(day).backgroundColor(Color.White)
                    .width('100%').height('100%').textAlign(TextAlign.Center)
                }
              })
            })
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .attributeModifier(this._useEffectGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.height('100%').width('100%').attributeModifier(this._useEffectListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.attributeModifier(this._useEffectListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .attributeModifier(this._useEffectListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          
          
          
        } else if (this.targetView == 'Panel') {
          
          
          
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.attributeModifier(this._useEffectRefreshMod)
        } else if (this.targetView == 'RelativeContainer') {
          RelativeContainer() {
            Row()
              .width(100)
              .height(100)
              .backgroundColor('#FF3333')
              .alignRules({
                top: { anchor: '__container__', align: VerticalAlign.Top },
                left: { anchor: '__container__', align: HorizontalAlign.Start }
              })
              .id('constraintSize')
          }.attributeModifier(this._useEffectRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().attributeModifier(this._useEffectRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.attributeModifier(this._useEffectRowSplitMod)
        } else if (this.targetView == 'Scroll') {
          Scroll() {
            Column() {
              ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
                Text('Scroll' + item.toString())
                  .width('90%')
                  .height(50)
                  .backgroundColor(Color.White)
                  .textAlign(TextAlign.Center)
              }, (item: int) => item.toString())
            }.width('100%')
          }.scrollBar(BarState.On).attributeModifier(this._useEffectScrollMod)
        } else if (this.targetView == 'SideBarContainer') {
          SideBarContainer(SideBarContainerType.Embed) {
            Column() {
              ForEach([1, 2, 3], (item: int) => {
                Column({ space: 5 } as ColumnOptions) {
                  Image($r('app.media.icon')).width(50).height(50)
                  Text('Index0' + item).fontSize(25)
                }
              })
            }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Green)

            Column() {
              Text('SideBarContainer content').fontSize(25)
            }.backgroundColor(Color.Orange)
          }
        } else if (this.targetView == 'Stack') {
          Stack() {
          }.attributeModifier(this._useEffectStackMod)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: int) => {
              Text('Swiper' + item).width('90%').height(50)
            }, (item: int) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#00CB87')
            }
          }.attributeModifier(this._useEffectTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').attributeModifier(this._useEffectTabContentMod)
          }.width('100%').height('100%')
        } else if (this.targetView == 'WaterFlow') {
          WaterFlow() {
            ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
              FlowItem() {
                Column() {
                  Text('WaterFlow' + item).fontSize(12).height('16')
                  Image($r('app.media.icon'))
                    .width(50)
                    .height(50)
                    .objectFit(ImageFit.Fill)
                }
              }
            }, (item: int) => item.toString())
          }.attributeModifier(this._useEffectWaterFlowMod)
        } else if (this.targetView == 'StepperItem') {
          Stepper() {
            StepperItem() {
              Column() {
                Text('Page One')
              }
            }
            .backgroundColor(Color.Red)
            
          }
          .backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row().width('100%').height('20vp')
            }
            .attributeModifier(this._useEffectGridColMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'FlowItem') {
          WaterFlow() {
            ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
              FlowItem() {
                Column() {
                  Text('WaterFlow' + item).fontSize(12).height('16')
                  Image($r('app.media.icon'))
                    .width(50)
                    .height(50)
                    .objectFit(ImageFit.Fill)
                }
              }
              .attributeModifier(this._useEffectFlowItemMod)
              .backgroundColor(Color.Yellow)
            }, (item: int) => item.toString())
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'GridItem') {
          Grid() {
            GridItem() {
              Text('4')
                .backgroundColor(0xFAEEE0)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }.rowStart(1).rowEnd(4)
            .attributeModifier(this._useEffectGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .attributeModifier(this._useEffectMenuItemMod)
            }.backgroundColor(Color.Yellow)
            .width('100%')
            .height('100%')
          }.width('100%').height('100%').backgroundColor(Color.Green)
        } else if (this.targetView == 'MenuItemGroup') {
          Row() {
            Menu() {
              MenuItemGroup({ header: 'MenuItemGroup' }) {
                MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              }
              .attributeModifier(this._useEffectMenuItemGroupMod)
            }.backgroundColor(Color.Yellow)
            .width('100%')
            .height('100%')
          }.width('100%').height('100%').backgroundColor(Color.Green)
        }
      }
      .width('100%')
      .height(this.parentHeight)
      .backgroundColor(Color.Pink)
      .key(this.parentComponentKey)
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Yellow)
  }
}