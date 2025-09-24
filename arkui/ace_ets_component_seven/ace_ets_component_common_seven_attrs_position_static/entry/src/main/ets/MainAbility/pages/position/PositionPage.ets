/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { ListItemGroupView } from '../../view/position/ListItemGroupView';
import { FlowItemView } from '../../view/position/FlowItemView';
import { StepperItemView } from '../../view/position/StepperItemView';
import { StepperView } from '../../view/position/StepperView';
import { NavRouterView } from '../../view/position/NavRouterView';
import { WaterFlowView } from '../../view/position/WaterFlowView';
import { TabsView } from '../../view/position/TabsView';
import { AlphabetIndexerView } from '../../view/position/AlphabetIndexerView';
import { NavigationView } from '../../view/position/NavigationView';
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
  ImageSpanAttribute, PatternLockAttribute, PluginComponentAttribute, UIExtensionComponentAttribute, Position } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class BadgeModifier implements AttributeModifier<BadgeAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: BadgeAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class BlankModifier implements AttributeModifier<BlankAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: BlankAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ButtonModifier implements AttributeModifier<ButtonAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ButtonAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: CalendarPickerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: CheckboxAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: CheckboxGroupAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ColumnModifier implements AttributeModifier<ColumnAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ColumnAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ColumnSplitAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class CounterModifier implements AttributeModifier<CounterAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: CounterAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: DataPanelAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: DatePickerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class DividerModifier implements AttributeModifier<DividerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: DividerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class EffectComponentModifier implements AttributeModifier<EffectComponentAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: EffectComponentAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class FlexModifier implements AttributeModifier<FlexAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: FlexAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: FlowItemAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class FormComponentModifier implements AttributeModifier<FormComponentAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: FormComponentAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: FormLinkAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class GaugeModifier implements AttributeModifier<GaugeAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: GaugeAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class GridModifier implements AttributeModifier<GridAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: GridAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class GridColModifier implements AttributeModifier<GridColAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: GridColAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class GridItemModifier implements AttributeModifier<GridItemAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: GridItemAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class GridRowModifier implements AttributeModifier<GridRowAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: GridRowAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: HyperlinkAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ImageSpanModifier implements AttributeModifier<ImageSpanAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ImageSpanAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ImageModifier implements AttributeModifier<ImageAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ImageAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ListModifier implements AttributeModifier<ListAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ListAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ListItemModifier implements AttributeModifier<ListItemAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ListItemAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: MarqueeAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class MenuModifier implements AttributeModifier<MenuAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: MenuAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: MenuItemAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: MenuItemGroupAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: NavDestinationAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class NavigationModifier implements AttributeModifier<NavigationAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: NavigationAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}














class PatternLockModifier implements AttributeModifier<PatternLockAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: PatternLockAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class PluginComponentModifier implements AttributeModifier<PluginComponentAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: PluginComponentAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: QRCodeAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RadioModifier implements AttributeModifier<RadioAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RadioAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RatingModifier implements AttributeModifier<RatingAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RatingAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RefreshModifier implements AttributeModifier<RefreshAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RefreshAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RelativeContainerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RemoteWindowAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RichTextModifier implements AttributeModifier<RichTextAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RichTextAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RowModifier implements AttributeModifier<RowAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RowAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: RowSplitAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ScrollModifier implements AttributeModifier<ScrollAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ScrollAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ScrollBarAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class SearchModifier implements AttributeModifier<SearchAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: SearchAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class SelectModifier implements AttributeModifier<SelectAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: SelectAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: SideBarContainerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class SliderModifier implements AttributeModifier<SliderAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: SliderAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class StackModifier implements AttributeModifier<StackAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: StackAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class StepperModifier implements AttributeModifier<StepperAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: StepperAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: StepperItemAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class SwiperModifier implements AttributeModifier<SwiperAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: SwiperAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TabContentModifier implements AttributeModifier<TabContentAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TabContentAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TabsModifier implements AttributeModifier<TabsAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TabsAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TextModifier implements AttributeModifier<TextAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TextAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TextAreaAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TextClockModifier implements AttributeModifier<TextClockAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TextClockAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TextInputModifier implements AttributeModifier<TextInputAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TextInputAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TextPickerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TextTimerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: TimePickerAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class ToggleModifier implements AttributeModifier<ToggleAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: ToggleAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class UIExtensionComponentModifier implements AttributeModifier<UIExtensionComponentAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: UIExtensionComponentAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class WebModifier implements AttributeModifier<WebAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: WebAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}
class XComponentModifier implements AttributeModifier<XComponentAttribute> {
  mPosition: Position = { x: 0, y: 0 };
  applyNormalAttribute(instance: XComponentAttribute): void {
    console.info(`position page show ${JSON.stringify(this.mPosition)}`)
    instance.position(this.mPosition)
  }
}

@Entry
@Component
struct PositionPage {
  
  private selectedTime: Date = new Date('2022-07-22T08:00:00')
  
  private src: string = 'Running Marquee starts rolling'
  
  private value: string[] = ['#', 'A', 'B']
  
  public valueArr: number[] = [5, 10, 10, 7, 9, 10, 10, 10, 10] as number[]
  @State _position: Position = { x: 1, y: 1 } as Position;
  @State _positionAlphabetIndexerMod: AlphabetIndexerModifier = new AlphabetIndexerModifier()
  @State _positionBadgeMod: BadgeModifier = new BadgeModifier()
  
  @State _positionBlankMod: BlankModifier = new BlankModifier()
  @State _positionButtonMod: ButtonModifier = new ButtonModifier()
  
  @State _positionCalendarPickerMod: CalendarPickerModifier = new CalendarPickerModifier()
  @State _positionCheckboxMod: CheckboxModifier = new CheckboxModifier()
  @State _positionCheckboxGroupMod: CheckboxGroupModifier = new CheckboxGroupModifier()
  @State _positionColumnMod: ColumnModifier = new ColumnModifier()
  @State _positionColumnSplitMod: ColumnSplitModifier = new ColumnSplitModifier()
  @State _positionCounterMod: CounterModifier = new CounterModifier()
  @State _positionDataPanelMod: DataPanelModifier = new DataPanelModifier()
  @State _positionDatePickerMod: DatePickerModifier = new DatePickerModifier()
  @State _positionDividerMod: DividerModifier = new DividerModifier()
  
  @State _positionEffectComponentMod: EffectComponentModifier = new EffectComponentModifier()
  @State _positionFlexMod: FlexModifier = new FlexModifier()
  @State _positionFlowItemMod: FlowItemModifier = new FlowItemModifier()
  
  @State _positionFormComponentMod: FormComponentModifier = new FormComponentModifier()
  
  @State _positionFormLinkMod: FormLinkModifier = new FormLinkModifier()
  @State _positionGaugeMod: GaugeModifier = new GaugeModifier()
  @State _positionGridMod: GridModifier = new GridModifier()
  @State _positionGridColMod: GridColModifier = new GridColModifier()
  @State _positionGridItemMod: GridItemModifier = new GridItemModifier()
  @State _positionGridRowMod: GridRowModifier = new GridRowModifier()
  
  @State _positionHyperlinkMod: HyperlinkModifier = new HyperlinkModifier()
  @State _positionImageAnimatorMod: ImageAnimatorModifier = new ImageAnimatorModifier()
  
  @State _positionImageSpanMod: ImageSpanModifier = new ImageSpanModifier()
  @State _positionImageMod: ImageModifier = new ImageModifier()
  @State _positionListMod: ListModifier = new ListModifier()
  @State _positionListItemMod: ListItemModifier = new ListItemModifier()
  
  @State _positionListItemGroupMod: ListItemGroupModifier = new ListItemGroupModifier()
  @State _positionLoadingProgressMod: LoadingProgressModifier = new LoadingProgressModifier()
  @State _positionMarqueeMod: MarqueeModifier = new MarqueeModifier()
  @State _positionMenuMod: MenuModifier = new MenuModifier()
  @State _positionMenuItemMod: MenuItemModifier = new MenuItemModifier()
  @State _positionMenuItemGroupMod: MenuItemGroupModifier = new MenuItemGroupModifier()
  
  @State _positionNavDestinationMod: NavDestinationModifier = new NavDestinationModifier()
  
  @State _positionNavigationMod: NavigationModifier = new NavigationModifier()
  
  
  @State _positionPatternLockMod: PatternLockModifier = new PatternLockModifier()
  
  @State _positionPluginComponentMod: PluginComponentModifier = new PluginComponentModifier()
  
  @State _positionQRCodeMod: QRCodeModifier = new QRCodeModifier()
  @State _positionRadioMod: RadioModifier = new RadioModifier()
  @State _positionRatingMod: RatingModifier = new RatingModifier()
  @State _positionRefreshMod: RefreshModifier = new RefreshModifier()
  @State _positionRelativeContainerMod: RelativeContainerModifier = new RelativeContainerModifier()
  
  @State _positionRemoteWindowMod: RemoteWindowModifier = new RemoteWindowModifier()
  
  @State _positionRichEditorMod: RichEditorModifier = new RichEditorModifier()
  @State _positionRichTextMod: RichTextModifier = new RichTextModifier()
  @State _positionRowMod: RowModifier = new RowModifier()
  @State _positionRowSplitMod: RowSplitModifier = new RowSplitModifier()
  @State _positionScrollMod: ScrollModifier = new ScrollModifier()
  @State _positionScrollBarMod: ScrollBarModifier = new ScrollBarModifier()
  @State _positionSearchMod: SearchModifier = new SearchModifier()
  @State _positionSelectMod: SelectModifier = new SelectModifier()
  @State _positionSideBarContainerMod: SideBarContainerModifier = new SideBarContainerModifier()
  @State _positionSliderMod: SliderModifier = new SliderModifier()
  @State _positionStackMod: StackModifier = new StackModifier()
  @State _positionStepperMod: StepperModifier = new StepperModifier()
  @State _positionStepperItemMod: StepperItemModifier = new StepperItemModifier()
  @State _positionSwiperMod: SwiperModifier = new SwiperModifier()
  @State _positionTabContentMod: TabContentModifier = new TabContentModifier()
  @State _positionTabsMod: TabsModifier = new TabsModifier()
  @State _positionTextMod: TextModifier = new TextModifier()
  @State _positionTextAreaMod: TextAreaModifier = new TextAreaModifier()
  @State _positionTextClockMod: TextClockModifier = new TextClockModifier()
  @State _positionTextInputMod: TextInputModifier = new TextInputModifier()
  @State _positionTextPickerMod: TextPickerModifier = new TextPickerModifier()
  @State _positionTextTimerMod: TextTimerModifier = new TextTimerModifier()
  @State _positionTimePickerMod: TimePickerModifier = new TimePickerModifier()
  @State _positionToggleMod: ToggleModifier = new ToggleModifier()
  
  @State _positionUIExtensionComponentMod: UIExtensionComponentModifier = new UIExtensionComponentModifier()
  @State _positionWaterFlowMod: WaterFlowModifier = new WaterFlowModifier()
  @State _positionWebMod: WebModifier = new WebModifier()
  
  @State _positionXComponentMod: XComponentModifier = new XComponentModifier()
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView ?? '';
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey ?? '';
  @State parentWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
  @State parentHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
  @State parentBackGroundColor: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentBackGroundColor ?? ''
  @State BackGroundColor: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.BackGroundColor ?? ''
  @State parentComponentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey ?? '';
  @State columns: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.columns ?? 0
  @State gutter: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.gutter ?? 0


  onPageShow() {
    console.info('[positionPage] page show called ')
    
    attrsManager.registerDataChange((value: Position) => {
      console.info('[registerDataChange] value' + value)
      this._positionAlphabetIndexerMod.mPosition = value
      this._positionBadgeMod.mPosition = value
      this._positionBlankMod.mPosition = value
      this._positionButtonMod.mPosition = value
      this._positionCalendarPickerMod.mPosition = value
      this._positionCheckboxMod.mPosition = value
      this._positionCheckboxGroupMod.mPosition = value
      this._positionColumnMod.mPosition = value
      this._positionColumnSplitMod.mPosition = value
      this._positionCounterMod.mPosition = value
      this._positionDataPanelMod.mPosition = value
      this._positionDatePickerMod.mPosition = value
      this._positionDividerMod.mPosition = value
      this._positionEffectComponentMod.mPosition = value
      this._positionFlexMod.mPosition = value
      this._positionFlowItemMod.mPosition = value
      this._positionFormComponentMod.mPosition = value
      this._positionFormLinkMod.mPosition = value
      this._positionGaugeMod.mPosition = value
      this._positionGridMod.mPosition = value
      this._positionGridColMod.mPosition = value
      this._positionGridItemMod.mPosition = value
      this._positionGridRowMod.mPosition = value
      this._positionHyperlinkMod.mPosition = value
      this._positionImageAnimatorMod.mPosition = value
      this._positionImageSpanMod.mPosition = value
      this._positionImageMod.mPosition = value
      this._positionListMod.mPosition = value
      this._positionListItemMod.mPosition = value
      this._positionListItemGroupMod.mPosition = value
      this._positionLoadingProgressMod.mPosition = value
      this._positionMarqueeMod.mPosition = value
      this._positionMenuMod.mPosition = value
      this._positionMenuItemMod.mPosition = value
      this._positionMenuItemGroupMod.mPosition = value
      this._positionNavDestinationMod.mPosition = value
      
      this._positionNavigationMod.mPosition = value
      
      this._positionPatternLockMod.mPosition = value
      this._positionPluginComponentMod.mPosition = value
      this._positionQRCodeMod.mPosition = value
      this._positionRadioMod.mPosition = value
      this._positionRatingMod.mPosition = value
      this._positionRefreshMod.mPosition = value
      this._positionRelativeContainerMod.mPosition = value
      this._positionRemoteWindowMod.mPosition = value
      this._positionRichEditorMod.mPosition = value
      this._positionRichTextMod.mPosition = value
      this._positionRowMod.mPosition = value
      this._positionRowSplitMod.mPosition = value
      this._positionScrollMod.mPosition = value
      this._positionScrollBarMod.mPosition = value
      this._positionSearchMod.mPosition = value
      this._positionSelectMod.mPosition = value
      this._positionSideBarContainerMod.mPosition = value
      this._positionSliderMod.mPosition = value
      this._positionStackMod.mPosition = value
      this._positionStepperMod.mPosition = value
      this._positionStepperItemMod.mPosition = value
      this._positionSwiperMod.mPosition = value
      this._positionTabContentMod.mPosition = value
      this._positionTabsMod.mPosition = value
      this._positionTextMod.mPosition = value
      this._positionTextAreaMod.mPosition = value
      this._positionTextClockMod.mPosition = value
      this._positionTextInputMod.mPosition = value
      this._positionTextPickerMod.mPosition = value
      this._positionTextTimerMod.mPosition = value
      this._positionTimePickerMod.mPosition = value
      this._positionToggleMod.mPosition = value
      this._positionUIExtensionComponentMod.mPosition = value
      this._positionWaterFlowMod.mPosition = value
      this._positionWebMod.mPosition = value
      this._positionXComponentMod.mPosition = value
    })
  }






  build() {
    GridRow({ columns: this.columns, gutter: this.gutter}) {
      Row() {
        if (this.targetView == 'Button') {
          Button('button1').attributeModifier(this._positionButtonMod)
        } else if (this.targetView == 'Text') {
          Text('text1').attributeModifier(this._positionTextMod)
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
          .attributeModifier(this._positionAlphabetIndexerMod)
        } else if (this.targetView == 'Blank') {
          Blank().backgroundColor(Color.Yellow).attributeModifier(this._positionBlankMod)
        } else if (this.targetView == 'Checkbox') {
          Checkbox().attributeModifier(this._positionCheckboxMod)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' }).attributeModifier(this._positionCheckboxGroupMod)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
          .attributeModifier(this._positionDataPanelMod)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          }).attributeModifier(this._positionDatePickerMod)
        } else if (this.targetView == 'Divider') {
          Divider().attributeModifier(this._positionDividerMod)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .attributeModifier(this._positionGaugeMod)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).attributeModifier(this._positionImageMod)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).attributeModifier(this._positionImageAnimatorMod)
        } else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().attributeModifier(this._positionLoadingProgressMod)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: Infinity as int,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).attributeModifier(this._positionMarqueeMod)
        } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
          }
        } else if (this.targetView == 'Menu') {
          Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
          }.backgroundColor(Color.Yellow).attributeModifier(this._positionMenuMod)
        } else if (this.targetView == 'NavRouter') {
          
          
          
          
          
          
          
          
        } else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse })
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').attributeModifier(this._positionQRCodeMod)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' }).attributeModifier(this._positionRadioMod)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).attributeModifier(this._positionRatingMod)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.attributeModifier(this._positionScrollBarMod)
        } else if (this.targetView == 'Search') {
          Search().attributeModifier(this._positionSearchMod)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa' },
            { value: 'bbb' }]).attributeModifier(this._positionSelectMod)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .attributeModifier(this._positionSliderMod)
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
          }).attributeModifier(this._positionTextAreaMod)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .attributeModifier(this._positionTextClockMod)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
          .attributeModifier(this._positionTextPickerMod)
        } else if (this.targetView == 'TextTimer') {
          TextTimer({ isCountDown: true, count: 30000 })
            .format('mm:ss.SS')
            .fontColor(Color.Black)
            .attributeModifier(this._positionTextTimerMod)
        } else if (this.targetView == 'TimePicker') {
          TimePicker({
            selected: new Date('2022-07-22T08:00:00'),
          }).attributeModifier(this._positionTimePickerMod)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false })
          .attributeModifier(this._positionToggleMod)
        } else if (this.targetView == 'Web') {
          Web({ src: 'www.example.com', controller: new WebviewController() })
          .attributeModifier(this._positionWebMod)
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
          }.attributeModifier(this._positionBadgeMod)
        } else if (this.targetView == 'Column') {
          Column() {
            Column().width('100%').height(30).backgroundColor(0xAFEEEE)
          }.attributeModifier(this._positionColumnMod)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }.attributeModifier(this._positionColumnSplitMod)
        } else if (this.targetView == 'Counter') {
          Counter() {
          }.attributeModifier(this._positionCounterMod)
        } else if (this.targetView == 'Flex') {
          Flex() {
            Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          }.attributeModifier(this._positionFlexMod)
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
          }.attributeModifier(this._positionGridRowMod)
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
          .attributeModifier(this._positionGridMod)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'List') {
          List() {
          }.height('100%').width('100%').attributeModifier(this._positionListMod)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.attributeModifier(this._positionListItemMod)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .attributeModifier(this._positionListItemGroupMod)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'Navigator') {
          
          
          
        } else if (this.targetView == 'Panel') {
          
          
          
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.attributeModifier(this._positionRefreshMod)
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
          }.attributeModifier(this._positionRelativeContainerMod)
        } else if (this.targetView == 'Row') {
          Row().attributeModifier(this._positionRowMod)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.attributeModifier(this._positionRowSplitMod)
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
          }.scrollBar(BarState.On).attributeModifier(this._positionScrollMod)
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
          }.attributeModifier(this._positionStackMod)
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
          }.attributeModifier(this._positionTabsMod)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
            }.tabBar('Tabs1').attributeModifier(this._positionTabContentMod)
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
          }.attributeModifier(this._positionWaterFlowMod)
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
            .attributeModifier(this._positionGridColMod)
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
              .attributeModifier(this._positionFlowItemMod)
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
            .attributeModifier(this._positionGridItemMod)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
                .attributeModifier(this._positionMenuItemMod)
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
              .attributeModifier(this._positionMenuItemGroupMod)
            }.backgroundColor(Color.Yellow)
            .width('100%')
            .height('100%')
          }.width('100%').height('100%').backgroundColor(Color.Green)
      }}
      .width('100%')
      .height(this.parentHeight)
      .backgroundColor(Color.Pink)
      .key(this.parentComponentKey)
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Yellow)
  }
}
