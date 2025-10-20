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
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions, LinearGradientOptions, GradientDirection } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { attrsManager } from '../../common/AttrsManager';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: BadgeAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: ButtonAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: BlankAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: CalendarPickerAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: CanvasAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: CheckboxAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: CheckboxGroupAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: CircleAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: ColumnAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: ColumnSplitAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: CounterAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: DataPanelAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: DatePickerAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: DividerAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: EllipseAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: FlexAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: FlowItemAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: FormLinkAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: GaugeAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class GridModifier implements AttributeModifier<GridAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: GridAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: GridColAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: GridItemAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: GridRowAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: ImageAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: ImageAnimatorAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class LineModifier implements AttributeModifier<LineAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: LineAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class ListModifier implements AttributeModifier<ListAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: ListAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: ListItemAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: ListItemGroupAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: LoadingProgressAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: MarqueeAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: MenuAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: MenuItemAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: MenuItemGroupAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: NavDestinationAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: NavigationAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}








































class PathModifier implements AttributeModifier<PathAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: PathAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: PolygonAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: PolylineAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: ProgressAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: QRCodeAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: RadioAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: RatingAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class RectModifier implements AttributeModifier<RectAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: RectAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: RefreshAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: RelativeContainerAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: RemoteWindowAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: RichEditorAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: RichTextAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class RowModifier implements AttributeModifier<RowAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: RowAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: RowSplitAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: ScrollAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: ScrollBarAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: SearchAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: SelectAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: ShapeAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: SideBarContainerAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: SliderAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: SpanAttribute): void {
		/* linearGradient not supported */
	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: StackAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class StepperModifier implements AttributeModifier<StepperAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: StepperAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: StepperItemAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: SwiperAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: TabContentAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: TabsAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class TextModifier implements AttributeModifier<TextAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: TextAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: TextAreaAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: TextClockAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: TextInputAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: TextPickerAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: TextTimerAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: TimePickerAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: ToggleAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: VideoAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: WaterFlowAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class WebModifier implements AttributeModifier<WebAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: WebAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: WindowSceneAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
	mLinearGradient: LinearGradientOptions = {
	direction: GradientDirection.Left,
	repeating: true,
	colors: [['FFFF0000', 0.0], ['#FF0000FF', 0.3], ['#FFFFFF00', 0.5]],
	angle: 10
}

	applyNormalAttribute(instance: XComponentAttribute): void {
		instance.linearGradient(this.mLinearGradient)
	}
}

@Entry
@Component
struct LinearGradientPage {
	@State _linearGradientAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
	@State _linearGradientBadgeModifier: BadgeModifier = new BadgeModifier()
	@State _linearGradientButtonModifier: ButtonModifier = new ButtonModifier()
	@State _linearGradientBlankModifier: BlankModifier = new BlankModifier()
	@State _linearGradientCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
	@State _linearGradientCanvasModifier: CanvasModifier = new CanvasModifier()
	@State _linearGradientCheckboxModifier: CheckboxModifier = new CheckboxModifier()
	@State _linearGradientCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
	@State _linearGradientCircleModifier: CircleModifier = new CircleModifier()
	@State _linearGradientColumnModifier: ColumnModifier = new ColumnModifier()
	@State _linearGradientColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
	@State _linearGradientCounterModifier: CounterModifier = new CounterModifier()
	@State _linearGradientDataPanelModifier: DataPanelModifier = new DataPanelModifier()
	@State _linearGradientDatePickerModifier: DatePickerModifier = new DatePickerModifier()
	@State _linearGradientDividerModifier: DividerModifier = new DividerModifier()
	@State _linearGradientEllipseModifier: EllipseModifier = new EllipseModifier()
	@State _linearGradientFlexModifier: FlexModifier = new FlexModifier()
	@State _linearGradientFlowItemModifier: FlowItemModifier = new FlowItemModifier()
	@State _linearGradientFormLinkModifier: FormLinkModifier = new FormLinkModifier()
	@State _linearGradientGaugeModifier: GaugeModifier = new GaugeModifier()
	@State _linearGradientGridModifier: GridModifier = new GridModifier()
	@State _linearGradientGridColModifier: GridColModifier = new GridColModifier()
	@State _linearGradientGridItemModifier: GridItemModifier = new GridItemModifier()
	@State _linearGradientGridRowModifier: GridRowModifier = new GridRowModifier()
	@State _linearGradientHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
	@State _linearGradientImageModifier: ImageModifier = new ImageModifier()
	@State _linearGradientImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
	@State _linearGradientLineModifier: LineModifier = new LineModifier()
	@State _linearGradientListModifier: ListModifier = new ListModifier()
	@State _linearGradientListItemModifier: ListItemModifier = new ListItemModifier()
	@State _linearGradientListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
	@State _linearGradientLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
	@State _linearGradientMarqueeModifier: MarqueeModifier = new MarqueeModifier()
	@State _linearGradientMenuModifier: MenuModifier = new MenuModifier()
	@State _linearGradientMenuItemModifier: MenuItemModifier = new MenuItemModifier()
	@State _linearGradientMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
	@State _linearGradientNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
	@State _linearGradientNavigationModifier: NavigationModifier = new NavigationModifier()
	
	
	
	@State _linearGradientPathModifier: PathModifier = new PathModifier()
	@State _linearGradientPolygonModifier: PolygonModifier = new PolygonModifier()
	@State _linearGradientPolylineModifier: PolylineModifier = new PolylineModifier()
	@State _linearGradientProgressModifier: ProgressModifier = new ProgressModifier()
	@State _linearGradientQRCodeModifier: QRCodeModifier = new QRCodeModifier()
	@State _linearGradientRadioModifier: RadioModifier = new RadioModifier()
	@State _linearGradientRatingModifier: RatingModifier = new RatingModifier()
	@State _linearGradientRectModifier: RectModifier = new RectModifier()
	@State _linearGradientRefreshModifier: RefreshModifier = new RefreshModifier()
	@State _linearGradientRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
	@State _linearGradientRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
	@State _linearGradientRichEditorModifier: RichEditorModifier = new RichEditorModifier()
	@State _linearGradientRichTextModifier: RichTextModifier = new RichTextModifier()
	@State _linearGradientRowModifier: RowModifier = new RowModifier()
	@State _linearGradientRowSplitModifier: RowSplitModifier = new RowSplitModifier()
	@State _linearGradientScrollModifier: ScrollModifier = new ScrollModifier()
	@State _linearGradientScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
	@State _linearGradientSearchModifier: SearchModifier = new SearchModifier()
	@State _linearGradientSelectModifier: SelectModifier = new SelectModifier()
	@State _linearGradientShapeModifier: ShapeModifier = new ShapeModifier()
	@State _linearGradientSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
	@State _linearGradientSliderModifier: SliderModifier = new SliderModifier()
	@State _linearGradientSpanModifier: SpanModifier = new SpanModifier()
	@State _linearGradientStackModifier: StackModifier = new StackModifier()
	@State _linearGradientStepperModifier: StepperModifier = new StepperModifier()
	@State _linearGradientStepperItemModifier: StepperItemModifier = new StepperItemModifier()
	@State _linearGradientSwiperModifier: SwiperModifier = new SwiperModifier()
	@State _linearGradientTabContentModifier: TabContentModifier = new TabContentModifier()
	@State _linearGradientTabsModifier: TabsModifier = new TabsModifier()
	@State _linearGradientTextModifier: TextModifier = new TextModifier()
	@State _linearGradientTextAreaModifier: TextAreaModifier = new TextAreaModifier()
	@State _linearGradientTextClockModifier: TextClockModifier = new TextClockModifier()
	@State _linearGradientTextInputModifier: TextInputModifier = new TextInputModifier()
	@State _linearGradientTextPickerModifier: TextPickerModifier = new TextPickerModifier()
	@State _linearGradientTextTimerModifier: TextTimerModifier = new TextTimerModifier()
	@State _linearGradientTimePickerModifier: TimePickerModifier = new TimePickerModifier()
	@State _linearGradientToggleModifier: ToggleModifier = new ToggleModifier()
	@State _linearGradientVideoModifier: VideoModifier = new VideoModifier()
	@State _linearGradientWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
	@State _linearGradientWebModifier: WebModifier = new WebModifier()
	@State _linearGradientWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
	@State _linearGradientXComponentModifier: XComponentModifier = new XComponentModifier()
	@State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView ?? '';
	@State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey ?? '';
	@State parentWidth: double = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
	@State parentHeight: double = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
	@State columns: int = ((this.getUIContext().getRouter().getParams() as RouterParams).view.columns as int) ?? 0
	@State gutter: int = ((this.getUIContext().getRouter().getParams() as RouterParams).view.gutter as int) ?? 0
	@State parentBackGroundColor: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentBackGroundColor ?? '#FFFF00'
  	@State parentComponentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey ?? '';

	onPageShow() {
		console.info('linearGradient translate page show called ')
    attrsManager.registerDataChange((value: SetValue) => {
			console.info('linearGradient [registerDataChange] ' + JSON.stringify(value.linearGradient))
			this._linearGradientAlphabetIndexerModifier.mLinearGradient = value.linearGradient
			this._linearGradientBadgeModifier.mLinearGradient = value.linearGradient
			this._linearGradientButtonModifier.mLinearGradient = value.linearGradient
			this._linearGradientBlankModifier.mLinearGradient = value.linearGradient
			this._linearGradientCalendarPickerModifier.mLinearGradient = value.linearGradient
			this._linearGradientCanvasModifier.mLinearGradient = value.linearGradient
			this._linearGradientCheckboxModifier.mLinearGradient = value.linearGradient
			this._linearGradientCheckboxGroupModifier.mLinearGradient = value.linearGradient
			this._linearGradientCircleModifier.mLinearGradient = value.linearGradient
			this._linearGradientColumnModifier.mLinearGradient = value.linearGradient
			this._linearGradientColumnSplitModifier.mLinearGradient = value.linearGradient
			this._linearGradientCounterModifier.mLinearGradient = value.linearGradient
			this._linearGradientDataPanelModifier.mLinearGradient = value.linearGradient
			this._linearGradientDatePickerModifier.mLinearGradient = value.linearGradient
			this._linearGradientDividerModifier.mLinearGradient = value.linearGradient
			this._linearGradientEllipseModifier.mLinearGradient = value.linearGradient
			this._linearGradientFlexModifier.mLinearGradient = value.linearGradient
			this._linearGradientFlowItemModifier.mLinearGradient = value.linearGradient
			this._linearGradientFormLinkModifier.mLinearGradient = value.linearGradient
			this._linearGradientGaugeModifier.mLinearGradient = value.linearGradient
			this._linearGradientGridModifier.mLinearGradient = value.linearGradient
			this._linearGradientGridColModifier.mLinearGradient = value.linearGradient
			this._linearGradientGridItemModifier.mLinearGradient = value.linearGradient
			this._linearGradientGridRowModifier.mLinearGradient = value.linearGradient
			this._linearGradientHyperlinkModifier.mLinearGradient = value.linearGradient
			this._linearGradientImageModifier.mLinearGradient = value.linearGradient
			this._linearGradientImageAnimatorModifier.mLinearGradient = value.linearGradient
			this._linearGradientLineModifier.mLinearGradient = value.linearGradient
			this._linearGradientListModifier.mLinearGradient = value.linearGradient
			this._linearGradientListItemModifier.mLinearGradient = value.linearGradient
			this._linearGradientListItemGroupModifier.mLinearGradient = value.linearGradient
			this._linearGradientLoadingProgressModifier.mLinearGradient = value.linearGradient
			this._linearGradientMarqueeModifier.mLinearGradient = value.linearGradient
			this._linearGradientMenuModifier.mLinearGradient = value.linearGradient
			this._linearGradientMenuItemModifier.mLinearGradient = value.linearGradient
			this._linearGradientMenuItemGroupModifier.mLinearGradient = value.linearGradient
			this._linearGradientNavDestinationModifier.mLinearGradient = value.linearGradient
			this._linearGradientNavigationModifier.mLinearGradient = value.linearGradient
			
			
			
			this._linearGradientPathModifier.mLinearGradient = value.linearGradient
			this._linearGradientPolygonModifier.mLinearGradient = value.linearGradient
			this._linearGradientPolylineModifier.mLinearGradient = value.linearGradient
			this._linearGradientProgressModifier.mLinearGradient = value.linearGradient
			this._linearGradientQRCodeModifier.mLinearGradient = value.linearGradient
			this._linearGradientRadioModifier.mLinearGradient = value.linearGradient
			this._linearGradientRatingModifier.mLinearGradient = value.linearGradient
			this._linearGradientRectModifier.mLinearGradient = value.linearGradient
			this._linearGradientRefreshModifier.mLinearGradient = value.linearGradient
			this._linearGradientRelativeContainerModifier.mLinearGradient = value.linearGradient
			this._linearGradientRemoteWindowModifier.mLinearGradient = value.linearGradient
			this._linearGradientRichEditorModifier.mLinearGradient = value.linearGradient
			this._linearGradientRichTextModifier.mLinearGradient = value.linearGradient
			this._linearGradientRowModifier.mLinearGradient = value.linearGradient
			this._linearGradientRowSplitModifier.mLinearGradient = value.linearGradient
			this._linearGradientScrollModifier.mLinearGradient = value.linearGradient
			this._linearGradientScrollBarModifier.mLinearGradient = value.linearGradient
			this._linearGradientSearchModifier.mLinearGradient = value.linearGradient
			this._linearGradientSelectModifier.mLinearGradient = value.linearGradient
			this._linearGradientShapeModifier.mLinearGradient = value.linearGradient
			this._linearGradientSideBarContainerModifier.mLinearGradient = value.linearGradient
			this._linearGradientSliderModifier.mLinearGradient = value.linearGradient
			this._linearGradientSpanModifier.mLinearGradient = value.linearGradient
			this._linearGradientStackModifier.mLinearGradient = value.linearGradient
			this._linearGradientStepperModifier.mLinearGradient = value.linearGradient
			this._linearGradientStepperItemModifier.mLinearGradient = value.linearGradient
			this._linearGradientSwiperModifier.mLinearGradient = value.linearGradient
			this._linearGradientTabContentModifier.mLinearGradient = value.linearGradient
			this._linearGradientTabsModifier.mLinearGradient = value.linearGradient
			this._linearGradientTextModifier.mLinearGradient = value.linearGradient
			this._linearGradientTextAreaModifier.mLinearGradient = value.linearGradient
			this._linearGradientTextClockModifier.mLinearGradient = value.linearGradient
			this._linearGradientTextInputModifier.mLinearGradient = value.linearGradient
			this._linearGradientTextPickerModifier.mLinearGradient = value.linearGradient
			this._linearGradientTextTimerModifier.mLinearGradient = value.linearGradient
			this._linearGradientTimePickerModifier.mLinearGradient = value.linearGradient
			this._linearGradientToggleModifier.mLinearGradient = value.linearGradient
			this._linearGradientVideoModifier.mLinearGradient = value.linearGradient
			this._linearGradientWaterFlowModifier.mLinearGradient = value.linearGradient
			this._linearGradientWebModifier.mLinearGradient = value.linearGradient
			this._linearGradientWindowSceneModifier.mLinearGradient = value.linearGradient
			this._linearGradientXComponentModifier.mLinearGradient = value.linearGradient
		})
	}

  
  
  
  

	build() {
		Column() {
			if (this.targetView == 'AlphabetIndexer') {
				AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
					
					.attributeModifier(this._linearGradientAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					
					.attributeModifier(this._linearGradientButtonModifier)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					
					.attributeModifier(this._linearGradientBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					
					.attributeModifier(this._linearGradientCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					
					.attributeModifier(this._linearGradientCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					
					.attributeModifier(this._linearGradientDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					
					.attributeModifier(this._linearGradientDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					
					.attributeModifier(this._linearGradientDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					
					.attributeModifier(this._linearGradientGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					
					.attributeModifier(this._linearGradientImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					
					.attributeModifier(this._linearGradientImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					
					.attributeModifier(this._linearGradientLoadingProgressModifier)
			}
			if (this.targetView == 'Marquee') {
				Marquee({ 
					start: true,
					step: 50,
					loop: Infinity as int,
					fromStart: true,
					src: 'Running Marquee starts rolling'
				})
					
					.attributeModifier(this._linearGradientMarqueeModifier)
			}
			if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack()) {
				}
					
					
			}
			if (this.targetView == 'Menu') {
				Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
				}
					.backgroundColor(Color.Yellow)
					
					.attributeModifier(this._linearGradientMenuModifier)
			}
			if (this.targetView == 'NavRouter') {
				
				
				
				
				
				
				
				
				
				
				
				
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					
					.attributeModifier(this._linearGradientProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					
					.attributeModifier(this._linearGradientQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					
					.attributeModifier(this._linearGradientRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					
					.attributeModifier(this._linearGradientRatingModifier)
			}
			if (this.targetView == 'ScrollBar') {
				ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
					Text()
						.width(20)
						.height(100)
						.borderRadius(10)
						.backgroundColor('#C0C0C0')
				}
					
					.attributeModifier(this._linearGradientScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					
					.attributeModifier(this._linearGradientSearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					
					.attributeModifier(this._linearGradientSelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					
					.attributeModifier(this._linearGradientSliderModifier)
			}
			if (this.targetView == 'Stepper') {
				Stepper() {
					StepperItem() {
						Column() {
							Text('Page One')
						}
					}
				}
					
					
			}
			if (this.targetView == 'StepperItem') {
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
			}
			if (this.targetView == 'Text') {
				Text('text1')
					
					.attributeModifier(this._linearGradientTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					
					.attributeModifier(this._linearGradientTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					
					.attributeModifier(this._linearGradientTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					
					.attributeModifier(this._linearGradientTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					
					.attributeModifier(this._linearGradientTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					
					.attributeModifier(this._linearGradientTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					
					.attributeModifier(this._linearGradientTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					
					.attributeModifier(this._linearGradientToggleModifier)
			}
			if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: new WebviewController() })
					
					.attributeModifier(this._linearGradientWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					
					.attributeModifier(this._linearGradientCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					
					.attributeModifier(this._linearGradientEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					
					.attributeModifier(this._linearGradientLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					
					.attributeModifier(this._linearGradientPolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					
					.attributeModifier(this._linearGradientPolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					
					.attributeModifier(this._linearGradientPathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					
					.attributeModifier(this._linearGradientRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._linearGradientShapeModifier)
			}
			if (this.targetView == 'Badge') {
        Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } } as BadgeParamWithNumber) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					
					.attributeModifier(this._linearGradientBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button('')
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._linearGradientColumnModifier)
			}
			if (this.targetView == 'ColumnSplit') {
				ColumnSplit() {
					Text('1')
						.width('100%')
						.height(50)
						.backgroundColor(0xF5DEB3)
						.textAlign(TextAlign.Center)
				}
					
					.attributeModifier(this._linearGradientColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					
					.attributeModifier(this._linearGradientCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					
					.attributeModifier(this._linearGradientFlexModifier)
			}
			if (this.targetView == 'GridRow') {
				GridRow({ columns: 1, direction: GridRowDirection.Row }) {
					ForEach(
						[Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown],
						(color:Color) => {
							GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
								Row()
									.width('100%')
									.height('20vp')
							}
								.borderColor(color)
								.borderWidth(2)
						}
					)
				}
					
					.attributeModifier(this._linearGradientGridRowModifier)
			}
			if (this.targetView == 'Grid') {
				Grid() {
          ForEach(['0', '1', '2', '3', '4'], (item: string) => {
						ForEach(['0', '1', '2', '3', '4'], (day: string) => {
							GridItem() {
								Text(day)
									.backgroundColor(Color.White)
									.width('100%')
									.height('100%')
									.textAlign(TextAlign.Center)
							}
						})
					})
				}
					.columnsTemplate('1fr 1fr 1fr 1fr 1fr')
					.rowsTemplate('1fr 1fr 1fr 1fr 1fr')
					.backgroundColor(0xFAEEE0)
					
					.attributeModifier(this._linearGradientGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					
					.attributeModifier(this._linearGradientListModifier)
			}
			if (this.targetView == 'ListItem') {
				List({ space: 20, initialIndex: 0 }) {
					ListItem() {
						Text('item1')
							.width('100%')
							.textAlign(TextAlign.Center)
							.backgroundColor(Color.White)
					}
						
						.attributeModifier(this._linearGradientListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._linearGradientListItemGroupModifier)
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'Navigator') {
				
				
				
				
				
				
				
				
			}
			if (this.targetView == 'Panel') {
				
				
				
				
				
				
			}
			if (this.targetView == 'Refresh') {
				Refresh({ refreshing: true }) {
					Text('123')
				}
					
					.attributeModifier(this._linearGradientRefreshModifier)
			}
			if (this.targetView == 'RelativeContainer') {
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
					
					.attributeModifier(this._linearGradientRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					
					.attributeModifier(this._linearGradientRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					
					.attributeModifier(this._linearGradientRowSplitModifier)
			}
			if (this.targetView == 'Scroll') {
				Scroll() {
					Column() {
            ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: int) => {
							Text('Scroll' + item.toString())
								.width('90%')
								.height(50)
								.backgroundColor(Color.White)
								.textAlign(TextAlign.Center)
            }, (item: int, index: int) => item.toString())
					}
					.width('100%')
				}
					.scrollBar(BarState.On)
					
					.attributeModifier(this._linearGradientScrollModifier)
			}
			if (this.targetView == 'SideBarContainer') {
				SideBarContainer(SideBarContainerType.Embed) {
					Column() {
						ForEach([1, 2, 3], (item: int, index: int) => {
							Column({ space: 5 } as ColumnOptions) {
								Image($r('app.media.icon'))
									.width(50)
									.height(50)
								Text('Index0' + item)
									.fontSize(25)
							}
						})
					}
						.width('100%')
						.justifyContent(FlexAlign.SpaceEvenly)
						.backgroundColor(Color.Green)

					Column() {
						Text('SideBarContainer content')
							.fontSize(25)
					}
						.backgroundColor(Color.Orange)
				}
					
					
			}
			if (this.targetView == 'Stack') {
				Stack() {
				}
					
					.attributeModifier(this._linearGradientStackModifier)
			}
			if (this.targetView == 'Swiper') {
				Swiper() {
          ForEach([1, 2, 3], (item: int, index: int) => {
						Text('Swiper' + item)
							.width('90%')
							.height(50)
          }, (item: int, index: int) => item.toString())
				}
					.indicator(true)
					.backgroundColor(Color.White)
					
					
			}
			if (this.targetView == 'Tabs') {
				Tabs() {
					TabContent() {
						Column()
							.width('100%')
							.height('100%')
							.backgroundColor('#00CB87')
					}
				}
					
					.attributeModifier(this._linearGradientTabsModifier)
			}
			if (this.targetView == 'TabContent') {
				Tabs() {
					TabContent() {
						Text('TabContent Test')
							.width('100%')
							.height('100%')
							.backgroundColor(Color.White)
					}
						.tabBar('Tabs1')
						
						.attributeModifier(this._linearGradientTabContentModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'WaterFlow') {
				WaterFlow() {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: int) => {
						FlowItem() {
							Column() {
								Text('WaterFlow' + item)
									.fontSize(12)
									.height('16')
								Image($r('app.media.icon'))
									.width(50)
									.height(50)
									.objectFit(ImageFit.Fill)
							}
						}
          }, (item: int, index: int) => item.toString())
				}
					
					.attributeModifier(this._linearGradientWaterFlowModifier)
			}
			if (this.targetView == 'GridCol') {
				GridRow({ columns: 1, direction: GridRowDirection.Row }) {
					GridCol() {
						Row()
							.width('100%')
							.height('20vp')
					}
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._linearGradientGridColModifier)
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'GridItem') {
				Grid() {
					GridItem() {
						Text('4')
							.backgroundColor(0xFAEEE0)
							.width('100%')
							.height('100%')
							.textAlign(TextAlign.Center)
					}
						.rowStart(1)
						.rowEnd(4)
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._linearGradientGridItemModifier)
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'FlowItem') {
				WaterFlow() {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int, index: int) => {
						FlowItem() {
							Column() {
								Text('WaterFlow' + item)
									.fontSize(12)
									.height('16')
								Image($r('app.media.icon'))
									.width(50)
									.height(50)
									.objectFit(ImageFit.Fill)
							}
						}
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._linearGradientFlowItemModifier)
          }, (item: int, index: int) => item.toString())
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'MenuItem') {
				Row() {
					Menu() {
						MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
							
							.attributeModifier(this._linearGradientMenuItemModifier)
					}
						.backgroundColor(Color.Yellow)
						.width('100%')
						.height('100%')
				}
					.width('100%')
					.height('100%')
					.backgroundColor(Color.Green)
			}
			if (this.targetView == 'MenuItemGroup') {
				Row() {
					Menu() {
						MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
						}
							
							.attributeModifier(this._linearGradientMenuItemGroupModifier)
					}
						.backgroundColor(Color.Yellow)
						.width('100%')
						.height('100%')
				}
					.width('100%')
					.height('100%')
					.backgroundColor(Color.Green)
			}
			if (this.targetView == 'CalendarPicker') {
				CalendarPicker({ hintRadius: 10, selected: new Date() })
					
					.attributeModifier(this._linearGradientCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					
					.attributeModifier(this._linearGradientCanvasModifier)
			}
			if (this.targetView == 'FormLink') {
				FormLink({
					action: "router",
					abilityName: "EntryAbility",
          params: { message: 'testForRouter' } as ObjElement
        } as FormLinkOptions) {
					Button("router event").width(120)
				}
					
					.attributeModifier(this._linearGradientFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					
					.attributeModifier(this._linearGradientHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						
						.attributeModifier(this._linearGradientSpanModifier)
				}
			}
		}
		.width(this.parentWidth)
		.height(this.parentHeight)
		.backgroundColor(this.parentBackGroundColor || '#FFFF00')
		.key(this.parentComponentKey)
	}
}
class ObjElement {
  message?: string;
}