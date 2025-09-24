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
import { SetValue, RouterParams } from '../../common/Utils';


  class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
    applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
      instance.restoreId(2)
    }
  }
  class BadgeModifier implements AttributeModifier<BadgeAttribute> {
    applyNormalAttribute(instance: BadgeAttribute): void {
      instance.restoreId(2)
    }
  }
  class BlankModifier implements AttributeModifier<BlankAttribute> {
    applyNormalAttribute(instance: BlankAttribute): void {
      instance.restoreId(2)
    }
  }
  class ButtonModifier implements AttributeModifier<ButtonAttribute> {
    applyNormalAttribute(instance: ButtonAttribute): void {
      instance.restoreId(2)
    }
  }
  class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
    applyNormalAttribute(instance: CalendarPickerAttribute): void {
      instance.restoreId(2)
    }
  }
  class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
    applyNormalAttribute(instance: CheckboxAttribute): void {
      instance.restoreId(2)
    }
  }
  class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
    applyNormalAttribute(instance: CheckboxGroupAttribute): void {
      instance.restoreId(2)
    }
  }
  class ColumnModifier implements AttributeModifier<ColumnAttribute> {
    applyNormalAttribute(instance: ColumnAttribute): void {
      instance.restoreId(2)
    }
  }
  class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
    applyNormalAttribute(instance: ColumnSplitAttribute): void {
      instance.restoreId(2)
    }
  }
  class CounterModifier implements AttributeModifier<CounterAttribute> {
    applyNormalAttribute(instance: CounterAttribute): void {
      instance.restoreId(2)
    }
  }
  class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
    applyNormalAttribute(instance: DataPanelAttribute): void {
      instance.restoreId(2)
    }
  }
  class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
    applyNormalAttribute(instance: DatePickerAttribute): void {
      instance.restoreId(2)
    }
  }
  class DividerModifier implements AttributeModifier<DividerAttribute> {
    applyNormalAttribute(instance: DividerAttribute): void {
      instance.restoreId(2)
    }
  }
  class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
    applyNormalAttribute(instance: EffectComponentAttribute): void {
      instance.restoreId(2)
    }
  }
  class FlexModifier implements AttributeModifier<FlexAttribute> {
    applyNormalAttribute(instance: FlexAttribute): void {
      instance.restoreId(2)
    }
  }
  class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
    applyNormalAttribute(instance: FlowItemAttribute): void {
      instance.restoreId(2)
    }
  }
  class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
    applyNormalAttribute(instance: FormComponentAttribute): void {
      instance.restoreId(2)
    }
  }
  class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
    applyNormalAttribute(instance: FormLinkAttribute): void {
      instance.restoreId(2)
    }
  }
  class GaugeModifier implements AttributeModifier<GaugeAttribute> {
    applyNormalAttribute(instance: GaugeAttribute): void {
      instance.restoreId(2)
    }
  }
  class GridModifier implements AttributeModifier<GridAttribute> {
    applyNormalAttribute(instance: GridAttribute): void {
      instance.restoreId(2)
    }
  }
  class GridColModifier implements AttributeModifier<GridColAttribute> {
    applyNormalAttribute(instance: GridColAttribute): void {
      instance.restoreId(2)
    }
  }
  class GridItemModifier implements AttributeModifier<GridItemAttribute> {
    applyNormalAttribute(instance: GridItemAttribute): void {
      instance.restoreId(2)
    }
  }
  class GridRowModifier implements AttributeModifier<GridRowAttribute> {
    applyNormalAttribute(instance: GridRowAttribute): void {
      instance.restoreId(2)
    }
  }
  class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
    applyNormalAttribute(instance: HyperlinkAttribute): void {
      instance.restoreId(2)
    }
  }
  class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
    applyNormalAttribute(instance: ImageAnimatorAttribute): void {
      instance.restoreId(2)
    }
  }
  class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
    applyNormalAttribute(instance: ImageSpanAttribute): void {
      instance.restoreId(2)
    }
  }
  class ImageModifier implements AttributeModifier<ImageAttribute> {
    applyNormalAttribute(instance: ImageAttribute): void {
      instance.restoreId(2)
    }
  }
  class ListModifier implements AttributeModifier<ListAttribute> {
    applyNormalAttribute(instance: ListAttribute): void {
      instance.restoreId(2)
    }
  }
  class ListItemModifier implements AttributeModifier<ListItemAttribute> {
    applyNormalAttribute(instance: ListItemAttribute): void {
      instance.restoreId(2)
    }
  }
  class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
    applyNormalAttribute(instance: ListItemGroupAttribute): void {
      instance.restoreId(2)
    }
  }
  class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
    applyNormalAttribute(instance: LoadingProgressAttribute): void {
      instance.restoreId(2)
    }
  }
  class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
    applyNormalAttribute(instance: MarqueeAttribute): void {
      instance.restoreId(2)
    }
  }
  class MenuModifier implements AttributeModifier<MenuAttribute> {
    applyNormalAttribute(instance: MenuAttribute): void {
      instance.restoreId(2)
    }
  }
  class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
    applyNormalAttribute(instance: MenuItemAttribute): void {
      instance.restoreId(2)
    }
  }
  class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
    applyNormalAttribute(instance: MenuItemGroupAttribute): void {
      instance.restoreId(2)
    }
  }
  class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
    applyNormalAttribute(instance: NavDestinationAttribute): void {
      instance.restoreId(2)
    }
  }
  class NavigationModifier implements AttributeModifier<NavigationAttribute> {
    applyNormalAttribute(instance: NavigationAttribute): void {
      instance.restoreId(2)
    }
  }
  
  
  
  
  
  
  
  
  
  
  class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
    applyNormalAttribute(instance: PatternLockAttribute): void {
      instance.restoreId(2)
    }
  }
  class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
    applyNormalAttribute(instance: PluginComponentAttribute): void {
      instance.restoreId(2)
    }
  }
  class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
    applyNormalAttribute(instance: QRCodeAttribute): void {
      instance.restoreId(2)
    }
  }
  class RadioModifier implements AttributeModifier<RadioAttribute> {
    applyNormalAttribute(instance: RadioAttribute): void {
      instance.restoreId(2)
    }
  }
  class RatingModifier implements AttributeModifier<RatingAttribute> {
    applyNormalAttribute(instance: RatingAttribute): void {
      instance.restoreId(2)
    }
  }
  class RefreshModifier implements AttributeModifier<RefreshAttribute> {
    applyNormalAttribute(instance: RefreshAttribute): void {
      instance.restoreId(2)
    }
  }
  class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
    applyNormalAttribute(instance: RelativeContainerAttribute): void {
      instance.restoreId(2)
    }
  }
  class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
    applyNormalAttribute(instance: RemoteWindowAttribute): void {
      instance.restoreId(2)
    }
  }
  class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
    applyNormalAttribute(instance: RichEditorAttribute): void {
      instance.restoreId(2)
    }
  }
  class RichTextModifier implements AttributeModifier<RichTextAttribute> {
    applyNormalAttribute(instance: RichTextAttribute): void {
      instance.restoreId(2)
    }
  }
  class RowModifier implements AttributeModifier<RowAttribute> {
    applyNormalAttribute(instance: RowAttribute): void {
      instance.restoreId(2)
    }
  }
  class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
    applyNormalAttribute(instance: RowSplitAttribute): void {
      instance.restoreId(2)
    }
  }
  class ScrollModifier implements AttributeModifier<ScrollAttribute> {
    applyNormalAttribute(instance: ScrollAttribute): void {
      instance.restoreId(2)
    }
  }
  class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
    applyNormalAttribute(instance: ScrollBarAttribute): void {
      instance.restoreId(2)
    }
  }
  class SearchModifier implements AttributeModifier<SearchAttribute> {
    applyNormalAttribute(instance: SearchAttribute): void {
      instance.restoreId(2)
    }
  }
  class SelectModifier implements AttributeModifier<SelectAttribute> {
    applyNormalAttribute(instance: SelectAttribute): void {
      instance.restoreId(2)
    }
  }
  class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
    applyNormalAttribute(instance: SideBarContainerAttribute): void {
      instance.restoreId(2)
    }
  }
  class SliderModifier implements AttributeModifier<SliderAttribute> {
    applyNormalAttribute(instance: SliderAttribute): void {
      instance.restoreId(2)
    }
  }
  class StackModifier implements AttributeModifier<StackAttribute> {
    applyNormalAttribute(instance: StackAttribute): void {
      instance.restoreId(2)
    }
  }
  class StepperModifier implements AttributeModifier<StepperAttribute> {
    applyNormalAttribute(instance: StepperAttribute): void {
      instance.restoreId(2)
    }
  }
  class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
    applyNormalAttribute(instance: StepperItemAttribute): void {
      instance.restoreId(2)
    }
  }
  class SwiperModifier implements AttributeModifier<SwiperAttribute> {
    applyNormalAttribute(instance: SwiperAttribute): void {
      instance.restoreId(2)
    }
  }
  class TabContentModifier implements AttributeModifier<TabContentAttribute> {
    applyNormalAttribute(instance: TabContentAttribute): void {
      instance.restoreId(2)
    }
  }
  class TabsModifier implements AttributeModifier<TabsAttribute> {
    applyNormalAttribute(instance: TabsAttribute): void {
      instance.restoreId(2)
    }
  }
  class TextModifier implements AttributeModifier<TextAttribute> {
    applyNormalAttribute(instance: TextAttribute): void {
      instance.restoreId(2)
    }
  }
  class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
    applyNormalAttribute(instance: TextAreaAttribute): void {
      instance.restoreId(2)
    }
  }
  class TextClockModifier implements AttributeModifier<TextClockAttribute> {
    applyNormalAttribute(instance: TextClockAttribute): void {
      instance.restoreId(2)
    }
  }
  class TextInputModifier implements AttributeModifier<TextInputAttribute> {
    applyNormalAttribute(instance: TextInputAttribute): void {
      instance.restoreId(2)
    }
  }
  class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
    applyNormalAttribute(instance: TextPickerAttribute): void {
      instance.restoreId(2)
    }
  }
  class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
    applyNormalAttribute(instance: TextTimerAttribute): void {
      instance.restoreId(2)
    }
  }
  class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
    applyNormalAttribute(instance: TimePickerAttribute): void {
      instance.restoreId(2)
    }
  }
  class ToggleModifier implements AttributeModifier<ToggleAttribute> {
    applyNormalAttribute(instance: ToggleAttribute): void {
      instance.restoreId(2)
    }
  }
  class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
    applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
      instance.restoreId(2)
    }
  }
  class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
    applyNormalAttribute(instance: WaterFlowAttribute): void {
      instance.restoreId(2)
    }
  }
  class WebModifier implements AttributeModifier<WebAttribute> {
    applyNormalAttribute(instance: WebAttribute): void {
      instance.restoreId(2)
    }
  }
  class XComponentModifier implements AttributeModifier<XComponentAttribute> {
    applyNormalAttribute(instance: XComponentAttribute): void {
      instance.restoreId(2)
    }
  }

@Entry
@Component
struct restoreIdPage {
  @State _restoreIdAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _restoreIdBadgeMod: BadgeModifier = new BadgeModifier()
  @State _restoreIdBlankMod: BlankModifier = new BlankModifier()
  @State _restoreIdButttonMod: ButtonModifier = new ButtonModifier()
  @State _restoreIdCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _restoreIdCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _restoreIdCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _restoreIdColumnMod: ColumnModifier = new ColumnModifier()
  @State _restoreIdColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _restoreIdCounterMod: CounterModifier = new CounterModifier()
  @State _restoreIdDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _restoreIdDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _restoreIdDividerMod: DividerModifier = new DividerModifier()
  @State _restoreIdEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _restoreIdFlexMod: FlexModifier = new FlexModifier()
  @State _restoreIdFlowItemMod: FlowItemModifier = new FlowItemModifier()
  @State _restoreIdFormComponentMod: FormComponentModifier = new FormComponentModifier()
  @State _restoreIdFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _restoreIdGaugeMod: GaugeModifier = new GaugeModifier()
  @State _restoreIdGridMod: GridModifier = new GridModifier()
  @State _restoreIdGridColMod: GridColModifier = new GridColModifier()
  @State _restoreIdGridItemMod: GridItemModifier = new GridItemModifier()
  @State _restoreIdGridRowMod: GridRowModifier = new GridRowModifier()
  @State _restoreIdHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _restoreIdImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  @State _restoreIdImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _restoreIdImageMod: ImageModifier = new ImageModifier()
  @State _restoreIdListMod: ListModifier = new ListModifier()
  @State _restoreIdListItemMod: ListItemModifier = new ListItemModifier()
  @State _restoreIdListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _restoreIdLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _restoreIdMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _restoreIdMenuMod: MenuModifier = new MenuModifier()
  @State _restoreIdMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _restoreIdMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  @State _restoreIdNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  
  @State _restoreIdNavigationMod: NavigationModifier = new NavigationModifier()
  
  @State _restoreIdPatternLockMod: PatternLockModifier = new PatternLockModifier()
  @State _restoreIdPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  @State _restoreIdQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _restoreIdRadioMod: RadioModifier = new RadioModifier()
  @State _restoreIdRatingMod: RatingModifier = new RatingModifier()
  @State _restoreIdRefreshMod: RefreshModifier = new RefreshModifier()
  @State _restoreIdRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  @State _restoreIdRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  @State _restoreIdRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _restoreIdRichTextMod: RichTextModifier = new RichTextModifier()
  @State _restoreIdRowMod: RowModifier = new RowModifier()
  @State _restoreIdRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _restoreIdScrollMod: ScrollModifier = new ScrollModifier()
  @State _restoreIdScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _restoreIdSearchMod: SearchModifier = new SearchModifier()
  @State _restoreIdSelectMod: SelectModifier = new SelectModifier()
  @State _restoreIdSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _restoreIdSliderMod: SliderModifier = new SliderModifier()
  @State _restoreIdStackMod: StackModifier = new StackModifier()
  @State _restoreIdStepperMod: StepperModifier = new StepperModifier()
  @State _restoreIdStepperItemMod: StepperItemModifier = new StepperItemModifier()
  @State _restoreIdSwiperMod: SwiperModifier = new SwiperModifier()
  @State _restoreIdTabContentMod: TabContentModifier = new TabContentModifier()
  @State _restoreIdTabsMod: TabsModifier = new TabsModifier()
  @State _restoreIdTextMod: TextModifier = new TextModifier()
  @State _restoreIdTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _restoreIdTextClockMod: TextClockModifier = new TextClockModifier()
  @State _restoreIdTextInputMod: TextInputModifier = new TextInputModifier()
  @State _restoreIdTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _restoreIdTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _restoreIdTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _restoreIdToggleMod: ToggleModifier = new ToggleModifier()
  @State _restoreIdUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _restoreIdWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _restoreIdWebMod: WebModifier = new WebModifier()
  @State _restoreIdXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView ?? '';
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey ?? '';
  @State parentWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
  @State parentHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
  @State columns: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.columns ?? 0
  @State gutter: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.gutter ?? 0
  @State parentComponentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey ?? '';

  onPageShow() {
    console.info('restoreId page show called ')
    attrsManager.registerDataChange((value: SetValue) => {
      console.info('[registerDataChange] ' + JSON.stringify(value.restoreId))
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
    })
  }

  
  
  
  
  

  build() {
    GridRow({ columns: this.columns, gutter: this.gutter}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').attributeModifier(this._restoreIdButttonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').attributeModifier(this._restoreIdTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow)
        } else if (this.targetView == 'Checkbox') {
          Checkbox()
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' })
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          })
        } else if (this.targetView == 'Divider') {
          Divider()
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).attributeModifier(this._restoreIdImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ])
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().attributeModifier(this._restoreIdLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          })
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow)
        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
          
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling')
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' })
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false })
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }
        } else if (this.targetView == 'Search') {
          Search()
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }])
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            
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
          }).attributeModifier(this._restoreIdTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          })
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .attributeModifier(this._restoreIdToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
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
          }
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }
        } else if (this.targetView == 'Counter') {
          Counter() {
          }
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }
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
          }
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
          
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.height('100%').width('100%')
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          
          
          
        } else if (this.targetView == 'Panel') {
          
          
          
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.attributeModifier(this._restoreIdRefreshMod)
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
          }
        } else if (this.targetView == 'Row') {
          Row()
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }
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
          }.scrollBar(BarState.On).attributeModifier(this._restoreIdScrollMod)
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
          }.attributeModifier(this._restoreIdStackMod)
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
          }
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1')
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
          }
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
            
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                
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