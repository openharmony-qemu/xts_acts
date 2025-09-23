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
  BadgeParamWithNumber, ColumnOptions, ImageFit, NavPathStack, FormLinkOptions } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { SetValue, RouterParams } from '../../common/Utils';

class AlphabetIndexerModifier implements AttributeModifier<AlphabetIndexerAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: AlphabetIndexerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class BadgeModifier implements AttributeModifier<BadgeAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: BadgeAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ButtonModifier implements AttributeModifier<ButtonAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: ButtonAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class BlankModifier implements AttributeModifier<BlankAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: BlankAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class CalendarPickerModifier implements AttributeModifier<CalendarPickerAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: CalendarPickerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class CanvasModifier implements AttributeModifier<CanvasAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: CanvasAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class CheckboxModifier implements AttributeModifier<CheckboxAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: CheckboxAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class CheckboxGroupModifier implements AttributeModifier<CheckboxGroupAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: CheckboxGroupAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class CircleModifier implements AttributeModifier<CircleAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: CircleAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ColumnModifier implements AttributeModifier<ColumnAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: ColumnAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ColumnSplitModifier implements AttributeModifier<ColumnSplitAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: ColumnSplitAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class CounterModifier implements AttributeModifier<CounterAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: CounterAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class DataPanelModifier implements AttributeModifier<DataPanelAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: DataPanelAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class DatePickerModifier implements AttributeModifier<DatePickerAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: DatePickerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class DividerModifier implements AttributeModifier<DividerAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: DividerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class EllipseModifier implements AttributeModifier<EllipseAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: EllipseAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class FlexModifier implements AttributeModifier<FlexAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: FlexAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class FlowItemModifier implements AttributeModifier<FlowItemAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: FlowItemAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class FormLinkModifier implements AttributeModifier<FormLinkAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: FormLinkAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class GaugeModifier implements AttributeModifier<GaugeAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: GaugeAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class GridModifier implements AttributeModifier<GridAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: GridAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class GridColModifier implements AttributeModifier<GridColAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: GridColAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class GridItemModifier implements AttributeModifier<GridItemAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: GridItemAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class GridRowModifier implements AttributeModifier<GridRowAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: GridRowAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class HyperlinkModifier implements AttributeModifier<HyperlinkAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: HyperlinkAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ImageModifier implements AttributeModifier<ImageAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: ImageAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ImageAnimatorModifier implements AttributeModifier<ImageAnimatorAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: ImageAnimatorAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class LineModifier implements AttributeModifier<LineAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: LineAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ListModifier implements AttributeModifier<ListAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: ListAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ListItemModifier implements AttributeModifier<ListItemAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: ListItemAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ListItemGroupModifier implements AttributeModifier<ListItemGroupAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: ListItemGroupAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class LoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: LoadingProgressAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class MarqueeModifier implements AttributeModifier<MarqueeAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: MarqueeAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class MenuModifier implements AttributeModifier<MenuAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: MenuAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class MenuItemModifier implements AttributeModifier<MenuItemAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: MenuItemAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class MenuItemGroupModifier implements AttributeModifier<MenuItemGroupAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: MenuItemGroupAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class NavDestinationModifier implements AttributeModifier<NavDestinationAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: NavDestinationAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class NavigationModifier implements AttributeModifier<NavigationAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: NavigationAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

























class PathModifier implements AttributeModifier<PathAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: PathAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class PolygonModifier implements AttributeModifier<PolygonAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: PolygonAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class PolylineModifier implements AttributeModifier<PolylineAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: PolylineAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ProgressModifier implements AttributeModifier<ProgressAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: ProgressAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class QRCodeModifier implements AttributeModifier<QRCodeAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: QRCodeAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RadioModifier implements AttributeModifier<RadioAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: RadioAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RatingModifier implements AttributeModifier<RatingAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: RatingAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RectModifier implements AttributeModifier<RectAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: RectAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RefreshModifier implements AttributeModifier<RefreshAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: RefreshAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RelativeContainerModifier implements AttributeModifier<RelativeContainerAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: RelativeContainerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RemoteWindowModifier implements AttributeModifier<RemoteWindowAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: RemoteWindowAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: RichEditorAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RichTextModifier implements AttributeModifier<RichTextAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: RichTextAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RowModifier implements AttributeModifier<RowAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: RowAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class RowSplitModifier implements AttributeModifier<RowSplitAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: RowSplitAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ScrollModifier implements AttributeModifier<ScrollAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: ScrollAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ScrollBarModifier implements AttributeModifier<ScrollBarAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: ScrollBarAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class SearchModifier implements AttributeModifier<SearchAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: SearchAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class SelectModifier implements AttributeModifier<SelectAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: SelectAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ShapeModifier implements AttributeModifier<ShapeAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: ShapeAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class SideBarContainerModifier implements AttributeModifier<SideBarContainerAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: SideBarContainerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class SliderModifier implements AttributeModifier<SliderAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: SliderAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class SpanModifier implements AttributeModifier<SpanAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: SpanAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class StackModifier implements AttributeModifier<StackAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: StackAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class StepperModifier implements AttributeModifier<StepperAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: StepperAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class StepperItemModifier implements AttributeModifier<StepperItemAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: StepperItemAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class SwiperModifier implements AttributeModifier<SwiperAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: SwiperAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TabContentModifier implements AttributeModifier<TabContentAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: TabContentAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TabsModifier implements AttributeModifier<TabsAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: TabsAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TextModifier implements AttributeModifier<TextAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: TextAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TextAreaModifier implements AttributeModifier<TextAreaAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: TextAreaAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TextClockModifier implements AttributeModifier<TextClockAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: TextClockAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TextInputModifier implements AttributeModifier<TextInputAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: TextInputAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TextPickerModifier implements AttributeModifier<TextPickerAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: TextPickerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TextTimerModifier implements AttributeModifier<TextTimerAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: TextTimerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class TimePickerModifier implements AttributeModifier<TimePickerAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: TimePickerAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class ToggleModifier implements AttributeModifier<ToggleAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: ToggleAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class VideoModifier implements AttributeModifier<VideoAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: VideoAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class WaterFlowModifier implements AttributeModifier<WaterFlowAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: WaterFlowAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class WebModifier implements AttributeModifier<WebAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: WebAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class WindowSceneModifier implements AttributeModifier<WindowSceneAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: WindowSceneAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

class XComponentModifier implements AttributeModifier<XComponentAttribute> {
	mTabIndex: number = 1

	applyNormalAttribute(instance: XComponentAttribute): void {
		instance.tabIndex(this.mTabIndex)
	}
}

@Entry
@Component
struct TabIndexPage {
	@State _tabIndexAlphabetIndexerModifier: AlphabetIndexerModifier = new AlphabetIndexerModifier()
	@State _tabIndexBadgeModifier: BadgeModifier = new BadgeModifier()
	@State _tabIndexButtonModifier: ButtonModifier = new ButtonModifier()
	@State _tabIndexBlankModifier: BlankModifier = new BlankModifier()
	@State _tabIndexCalendarPickerModifier: CalendarPickerModifier = new CalendarPickerModifier()
	@State _tabIndexCanvasModifier: CanvasModifier = new CanvasModifier()
	@State _tabIndexCheckboxModifier: CheckboxModifier = new CheckboxModifier()
	@State _tabIndexCheckboxGroupModifier: CheckboxGroupModifier = new CheckboxGroupModifier()
	@State _tabIndexCircleModifier: CircleModifier = new CircleModifier()
	@State _tabIndexColumnModifier: ColumnModifier = new ColumnModifier()
	@State _tabIndexColumnSplitModifier: ColumnSplitModifier = new ColumnSplitModifier()
	@State _tabIndexCounterModifier: CounterModifier = new CounterModifier()
	@State _tabIndexDataPanelModifier: DataPanelModifier = new DataPanelModifier()
	@State _tabIndexDatePickerModifier: DatePickerModifier = new DatePickerModifier()
	@State _tabIndexDividerModifier: DividerModifier = new DividerModifier()
	@State _tabIndexEllipseModifier: EllipseModifier = new EllipseModifier()
	@State _tabIndexFlexModifier: FlexModifier = new FlexModifier()
	@State _tabIndexFlowItemModifier: FlowItemModifier = new FlowItemModifier()
	@State _tabIndexFormLinkModifier: FormLinkModifier = new FormLinkModifier()
	@State _tabIndexGaugeModifier: GaugeModifier = new GaugeModifier()
	@State _tabIndexGridModifier: GridModifier = new GridModifier()
	@State _tabIndexGridColModifier: GridColModifier = new GridColModifier()
	@State _tabIndexGridItemModifier: GridItemModifier = new GridItemModifier()
	@State _tabIndexGridRowModifier: GridRowModifier = new GridRowModifier()
	@State _tabIndexHyperlinkModifier: HyperlinkModifier = new HyperlinkModifier()
	@State _tabIndexImageModifier: ImageModifier = new ImageModifier()
	@State _tabIndexImageAnimatorModifier: ImageAnimatorModifier = new ImageAnimatorModifier()
	@State _tabIndexLineModifier: LineModifier = new LineModifier()
	@State _tabIndexListModifier: ListModifier = new ListModifier()
	@State _tabIndexListItemModifier: ListItemModifier = new ListItemModifier()
	@State _tabIndexListItemGroupModifier: ListItemGroupModifier = new ListItemGroupModifier()
	@State _tabIndexLoadingProgressModifier: LoadingProgressModifier = new LoadingProgressModifier()
	@State _tabIndexMarqueeModifier: MarqueeModifier = new MarqueeModifier()
	@State _tabIndexMenuModifier: MenuModifier = new MenuModifier()
	@State _tabIndexMenuItemModifier: MenuItemModifier = new MenuItemModifier()
	@State _tabIndexMenuItemGroupModifier: MenuItemGroupModifier = new MenuItemGroupModifier()
	@State _tabIndexNavDestinationModifier: NavDestinationModifier = new NavDestinationModifier()
	@State _tabIndexNavigationModifier: NavigationModifier = new NavigationModifier()
	
	
	
	@State _tabIndexPathModifier: PathModifier = new PathModifier()
	@State _tabIndexPolygonModifier: PolygonModifier = new PolygonModifier()
	@State _tabIndexPolylineModifier: PolylineModifier = new PolylineModifier()
	@State _tabIndexProgressModifier: ProgressModifier = new ProgressModifier()
	@State _tabIndexQRCodeModifier: QRCodeModifier = new QRCodeModifier()
	@State _tabIndexRadioModifier: RadioModifier = new RadioModifier()
	@State _tabIndexRatingModifier: RatingModifier = new RatingModifier()
	@State _tabIndexRectModifier: RectModifier = new RectModifier()
	@State _tabIndexRefreshModifier: RefreshModifier = new RefreshModifier()
	@State _tabIndexRelativeContainerModifier: RelativeContainerModifier = new RelativeContainerModifier()
	@State _tabIndexRemoteWindowModifier: RemoteWindowModifier = new RemoteWindowModifier()
	@State _tabIndexRichEditorModifier: RichEditorModifier = new RichEditorModifier()
	@State _tabIndexRichTextModifier: RichTextModifier = new RichTextModifier()
	@State _tabIndexRowModifier: RowModifier = new RowModifier()
	@State _tabIndexRowSplitModifier: RowSplitModifier = new RowSplitModifier()
	@State _tabIndexScrollModifier: ScrollModifier = new ScrollModifier()
	@State _tabIndexScrollBarModifier: ScrollBarModifier = new ScrollBarModifier()
	@State _tabIndexSearchModifier: SearchModifier = new SearchModifier()
	@State _tabIndexSelectModifier: SelectModifier = new SelectModifier()
	@State _tabIndexShapeModifier: ShapeModifier = new ShapeModifier()
	@State _tabIndexSideBarContainerModifier: SideBarContainerModifier = new SideBarContainerModifier()
	@State _tabIndexSliderModifier: SliderModifier = new SliderModifier()
	@State _tabIndexSpanModifier: SpanModifier = new SpanModifier()
	@State _tabIndexStackModifier: StackModifier = new StackModifier()
	@State _tabIndexStepperModifier: StepperModifier = new StepperModifier()
	@State _tabIndexStepperItemModifier: StepperItemModifier = new StepperItemModifier()
	@State _tabIndexSwiperModifier: SwiperModifier = new SwiperModifier()
	@State _tabIndexTabContentModifier: TabContentModifier = new TabContentModifier()
	@State _tabIndexTabsModifier: TabsModifier = new TabsModifier()
	@State _tabIndexTextModifier: TextModifier = new TextModifier()
	@State _tabIndexTextAreaModifier: TextAreaModifier = new TextAreaModifier()
	@State _tabIndexTextClockModifier: TextClockModifier = new TextClockModifier()
	@State _tabIndexTextInputModifier: TextInputModifier = new TextInputModifier()
	@State _tabIndexTextPickerModifier: TextPickerModifier = new TextPickerModifier()
	@State _tabIndexTextTimerModifier: TextTimerModifier = new TextTimerModifier()
	@State _tabIndexTimePickerModifier: TimePickerModifier = new TimePickerModifier()
	@State _tabIndexToggleModifier: ToggleModifier = new ToggleModifier()
	@State _tabIndexVideoModifier: VideoModifier = new VideoModifier()
	@State _tabIndexWaterFlowModifier: WaterFlowModifier = new WaterFlowModifier()
	@State _tabIndexWebModifier: WebModifier = new WebModifier()
	@State _tabIndexWindowSceneModifier: WindowSceneModifier = new WindowSceneModifier()
	@State _tabIndexXComponentModifier: XComponentModifier = new XComponentModifier()
  @State targetView: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.targetView ?? '';
  @State componentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.componentKey ?? '';
  @State parentWidth: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentWidth;
  @State parentHeight: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentHeight;
  @State columns: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.columns ?? 0
  @State gutter: number = (this.getUIContext().getRouter().getParams() as RouterParams).view.gutter ?? 0
  @State parentBackGroundColor: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentBackGroundColor ?? '#FFFF00'
  @State parentComponentKey: string = (this.getUIContext().getRouter().getParams() as RouterParams).view.parentComponentKey ?? '';

	onPageShow() {
		console.info('tabIndex translate page show called ')
    attrsManager.registerDataChange((value: SetValue) => {
			console.info('tabIndex [registerDataChange] ' + JSON.stringify(value.tabIndex))
			this._tabIndexAlphabetIndexerModifier.mTabIndex = value.tabIndex
			this._tabIndexBadgeModifier.mTabIndex = value.tabIndex
			this._tabIndexButtonModifier.mTabIndex = value.tabIndex
			this._tabIndexBlankModifier.mTabIndex = value.tabIndex
			this._tabIndexCalendarPickerModifier.mTabIndex = value.tabIndex
			this._tabIndexCanvasModifier.mTabIndex = value.tabIndex
			this._tabIndexCheckboxModifier.mTabIndex = value.tabIndex
			this._tabIndexCheckboxGroupModifier.mTabIndex = value.tabIndex
			this._tabIndexCircleModifier.mTabIndex = value.tabIndex
			this._tabIndexColumnModifier.mTabIndex = value.tabIndex
			this._tabIndexColumnSplitModifier.mTabIndex = value.tabIndex
			this._tabIndexCounterModifier.mTabIndex = value.tabIndex
			this._tabIndexDataPanelModifier.mTabIndex = value.tabIndex
			this._tabIndexDatePickerModifier.mTabIndex = value.tabIndex
			this._tabIndexDividerModifier.mTabIndex = value.tabIndex
			this._tabIndexEllipseModifier.mTabIndex = value.tabIndex
			this._tabIndexFlexModifier.mTabIndex = value.tabIndex
			this._tabIndexFlowItemModifier.mTabIndex = value.tabIndex
			this._tabIndexFormLinkModifier.mTabIndex = value.tabIndex
			this._tabIndexGaugeModifier.mTabIndex = value.tabIndex
			this._tabIndexGridModifier.mTabIndex = value.tabIndex
			this._tabIndexGridColModifier.mTabIndex = value.tabIndex
			this._tabIndexGridItemModifier.mTabIndex = value.tabIndex
			this._tabIndexGridRowModifier.mTabIndex = value.tabIndex
			this._tabIndexHyperlinkModifier.mTabIndex = value.tabIndex
			this._tabIndexImageModifier.mTabIndex = value.tabIndex
			this._tabIndexImageAnimatorModifier.mTabIndex = value.tabIndex
			this._tabIndexLineModifier.mTabIndex = value.tabIndex
			this._tabIndexListModifier.mTabIndex = value.tabIndex
			this._tabIndexListItemModifier.mTabIndex = value.tabIndex
			this._tabIndexListItemGroupModifier.mTabIndex = value.tabIndex
			this._tabIndexLoadingProgressModifier.mTabIndex = value.tabIndex
			this._tabIndexMarqueeModifier.mTabIndex = value.tabIndex
			this._tabIndexMenuModifier.mTabIndex = value.tabIndex
			this._tabIndexMenuItemModifier.mTabIndex = value.tabIndex
			this._tabIndexMenuItemGroupModifier.mTabIndex = value.tabIndex
			this._tabIndexNavDestinationModifier.mTabIndex = value.tabIndex
			this._tabIndexNavigationModifier.mTabIndex = value.tabIndex
			
			
			
			this._tabIndexPathModifier.mTabIndex = value.tabIndex
			this._tabIndexPolygonModifier.mTabIndex = value.tabIndex
			this._tabIndexPolylineModifier.mTabIndex = value.tabIndex
			this._tabIndexProgressModifier.mTabIndex = value.tabIndex
			this._tabIndexQRCodeModifier.mTabIndex = value.tabIndex
			this._tabIndexRadioModifier.mTabIndex = value.tabIndex
			this._tabIndexRatingModifier.mTabIndex = value.tabIndex
			this._tabIndexRectModifier.mTabIndex = value.tabIndex
			this._tabIndexRefreshModifier.mTabIndex = value.tabIndex
			this._tabIndexRelativeContainerModifier.mTabIndex = value.tabIndex
			this._tabIndexRemoteWindowModifier.mTabIndex = value.tabIndex
			this._tabIndexRichEditorModifier.mTabIndex = value.tabIndex
			this._tabIndexRichTextModifier.mTabIndex = value.tabIndex
			this._tabIndexRowModifier.mTabIndex = value.tabIndex
			this._tabIndexRowSplitModifier.mTabIndex = value.tabIndex
			this._tabIndexScrollModifier.mTabIndex = value.tabIndex
			this._tabIndexScrollBarModifier.mTabIndex = value.tabIndex
			this._tabIndexSearchModifier.mTabIndex = value.tabIndex
			this._tabIndexSelectModifier.mTabIndex = value.tabIndex
			this._tabIndexShapeModifier.mTabIndex = value.tabIndex
			this._tabIndexSideBarContainerModifier.mTabIndex = value.tabIndex
			this._tabIndexSliderModifier.mTabIndex = value.tabIndex
			this._tabIndexSpanModifier.mTabIndex = value.tabIndex
			this._tabIndexStackModifier.mTabIndex = value.tabIndex
			this._tabIndexStepperModifier.mTabIndex = value.tabIndex
			this._tabIndexStepperItemModifier.mTabIndex = value.tabIndex
			this._tabIndexSwiperModifier.mTabIndex = value.tabIndex
			this._tabIndexTabContentModifier.mTabIndex = value.tabIndex
			this._tabIndexTabsModifier.mTabIndex = value.tabIndex
			this._tabIndexTextModifier.mTabIndex = value.tabIndex
			this._tabIndexTextAreaModifier.mTabIndex = value.tabIndex
			this._tabIndexTextClockModifier.mTabIndex = value.tabIndex
			this._tabIndexTextInputModifier.mTabIndex = value.tabIndex
			this._tabIndexTextPickerModifier.mTabIndex = value.tabIndex
			this._tabIndexTextTimerModifier.mTabIndex = value.tabIndex
			this._tabIndexTimePickerModifier.mTabIndex = value.tabIndex
			this._tabIndexToggleModifier.mTabIndex = value.tabIndex
			this._tabIndexVideoModifier.mTabIndex = value.tabIndex
			this._tabIndexWaterFlowModifier.mTabIndex = value.tabIndex
			this._tabIndexWebModifier.mTabIndex = value.tabIndex
			this._tabIndexWindowSceneModifier.mTabIndex = value.tabIndex
			this._tabIndexXComponentModifier.mTabIndex = value.tabIndex
		})
	}

  
  
  
  

	build() {
		Column() {
			if (this.targetView == 'AlphabetIndexer') {
				AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
					
					.attributeModifier(this._tabIndexAlphabetIndexerModifier)
			}
			if (this.targetView == 'Button') {
				Button('button1')
					
					.attributeModifier(this._tabIndexButtonModifier)
			}
			if (this.targetView == 'Blank') {
				Blank()
					.backgroundColor(Color.Yellow)
					
					.attributeModifier(this._tabIndexBlankModifier)
			}
			if (this.targetView == 'Checkbox') {
				Checkbox()
					
					.attributeModifier(this._tabIndexCheckboxModifier)
			}
			if (this.targetView == 'CheckboxGroup') {
				CheckboxGroup({ group: 'checkboxGroup' })
					
					.attributeModifier(this._tabIndexCheckboxGroupModifier)
			}
			if (this.targetView == 'DataPanel') {
				DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] })
					
					.attributeModifier(this._tabIndexDataPanelModifier)
			}
			if (this.targetView == 'DatePicker') {
				DatePicker({ start: new Date('1970-1-1'), end: new Date('2100-1-1') })
					
					.attributeModifier(this._tabIndexDatePickerModifier)
			}
			if (this.targetView == 'Divider') {
				Divider()
					
					.attributeModifier(this._tabIndexDividerModifier)
			}
			if (this.targetView == 'Gauge') {
				Gauge({ value: 105 })
					.colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
					
					.attributeModifier(this._tabIndexGaugeModifier)
			}
			if (this.targetView == 'Image') {
				Image($r('app.media.icon'))
					
					.attributeModifier(this._tabIndexImageModifier)
			}
			if (this.targetView == 'ImageAnimator') {
				ImageAnimator()
					.images([{ src: $r('app.media.icon') }])
					
					.attributeModifier(this._tabIndexImageAnimatorModifier)
			}
			if (this.targetView == 'LoadingProgress') {
				LoadingProgress()
					
					.attributeModifier(this._tabIndexLoadingProgressModifier)
			}
			if (this.targetView == 'Marquee') {
				Marquee({ 
					start: true,
					step: 50,
					loop: Infinity as int,
					fromStart: true,
					src: 'Running Marquee starts rolling'
				})
					
					.attributeModifier(this._tabIndexMarqueeModifier)
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
					
					.attributeModifier(this._tabIndexMenuModifier)
			}
			if (this.targetView == 'NavRouter') {
				
				
				
				
				
				
				
				
				
				
				
				
			}
			if (this.targetView == 'Progress') {
				Progress({ value: 10, type: ProgressType.Eclipse })
					
					.attributeModifier(this._tabIndexProgressModifier)
			}
			if (this.targetView == 'QRCode') {
				QRCode('Running Marquee starts rolling')
					
					.attributeModifier(this._tabIndexQRCodeModifier)
			}
			if (this.targetView == 'Radio') {
				Radio({ value: 'Radio1', group: 'radioGroup' })
					
					.attributeModifier(this._tabIndexRadioModifier)
			}
			if (this.targetView == 'Rating') {
				Rating({ rating: 3.5, indicator: false })
					
					.attributeModifier(this._tabIndexRatingModifier)
			}
			if (this.targetView == 'ScrollBar') {
				ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
					Text()
						.width(20)
						.height(100)
						.borderRadius(10)
						.backgroundColor('#C0C0C0')
				}
					
					.attributeModifier(this._tabIndexScrollBarModifier)
			}
			if (this.targetView == 'Search') {
				Search()
					
					.attributeModifier(this._tabIndexSearchModifier)
			}
			if (this.targetView == 'Select') {
				Select([{ value: 'aaa' }, { value: 'bbb' }])
					
					.attributeModifier(this._tabIndexSelectModifier)
			}
			if (this.targetView == 'Slider') {
				Slider({ value: 50, min: 0, max: 100, style: SliderStyle.OutSet })
					.showTips(true)
					
					.attributeModifier(this._tabIndexSliderModifier)
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
					
					.attributeModifier(this._tabIndexTextModifier)
			}
			if (this.targetView == 'TextArea') {
				TextArea({ placeholder: 'The text area can hold an unlimited amount of text. input your word...' })
					
					.attributeModifier(this._tabIndexTextAreaModifier)
			}
			if (this.targetView == 'TextClock') {
				TextClock({ timeZoneOffset: -8 })
					.format('hms')
					
					.attributeModifier(this._tabIndexTextClockModifier)
			}
			if (this.targetView == 'TextInput') {
				TextInput({ placeholder: 'input your word...' })
					
					.attributeModifier(this._tabIndexTextInputModifier)
			}
			if (this.targetView == 'TextPicker') {
				TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] })
					
					.attributeModifier(this._tabIndexTextPickerModifier)
			}
			if (this.targetView == 'TextTimer') {
				TextTimer({ isCountDown: true, count: 30000 })
					.format('mm:ss.SS')
					.fontColor(Color.Black)
					
					.attributeModifier(this._tabIndexTextTimerModifier)
			}
			if (this.targetView == 'TimePicker') {
				TimePicker({ selected: new Date('2022-07-22T08:00:00') })
					
					.attributeModifier(this._tabIndexTimePickerModifier)
			}
			if (this.targetView == 'Toggle') {
				Toggle({ type: ToggleType.Switch, isOn: false })
					
					.attributeModifier(this._tabIndexToggleModifier)
			}
			if (this.targetView == 'Web') {
				Web({ src: 'www.example.com', controller: new WebviewController() })
					
					.attributeModifier(this._tabIndexWebModifier)
			}
			if (this.targetView == 'Circle') {
				Circle()
					.width(150)
					.height(200)
					
					.attributeModifier(this._tabIndexCircleModifier)
			}
			if (this.targetView == 'Ellipse') {
				Ellipse()
					
					.attributeModifier(this._tabIndexEllipseModifier)
			}
			if (this.targetView == 'Line') {
				Line()
					.startPoint([0, 0])
					.endPoint([50, 100])
					.backgroundColor(Color.Black)
					
					.attributeModifier(this._tabIndexLineModifier)
			}
			if (this.targetView == 'Polyline') {
				Polyline()
					
					.attributeModifier(this._tabIndexPolylineModifier)
			}
			if (this.targetView == 'Polygon') {
				Polygon()
					
					.attributeModifier(this._tabIndexPolygonModifier)
			}
			if (this.targetView == 'Path') {
				Path()
					
					.attributeModifier(this._tabIndexPathModifier)
			}
			if (this.targetView == 'Rect') {
				Rect()
					
					.attributeModifier(this._tabIndexRectModifier)
			}
			if (this.targetView == 'Shape') {
				Shape() {
					Rect()
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._tabIndexShapeModifier)
			}
			if (this.targetView == 'Badge') {
        Badge({ count: 50, style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } } as BadgeParamWithNumber) {
					Button('message')
						.width(100)
						.height(50)
						.backgroundColor(0x317aff)
				}
					
					.attributeModifier(this._tabIndexBadgeModifier)
			}
			if (this.targetView == 'Column') {
				Column() {
					Button('')
						.width(100)
						.height(50)
				}
					
					.attributeModifier(this._tabIndexColumnModifier)
			}
			if (this.targetView == 'ColumnSplit') {
				ColumnSplit() {
					Text('1')
						.width('100%')
						.height(50)
						.backgroundColor(0xF5DEB3)
						.textAlign(TextAlign.Center)
				}
					
					.attributeModifier(this._tabIndexColumnSplitModifier)
			}
			if (this.targetView == 'Counter') {
				Counter() {
				}
					
					.attributeModifier(this._tabIndexCounterModifier)
			}
			if (this.targetView == 'Flex') {
				Flex() {
					Text('1')
						.width('20%')
						.height(50)
						.backgroundColor(0xF5DEB3)
				}
					
					.attributeModifier(this._tabIndexFlexModifier)
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
					
					.attributeModifier(this._tabIndexGridRowModifier)
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
					
					.attributeModifier(this._tabIndexGridModifier)
			}
			if (this.targetView == 'List') {
				List() {
				}
					.height('100%')
					.width('100%')
					
					.attributeModifier(this._tabIndexListModifier)
			}
			if (this.targetView == 'ListItem') {
				List({ space: 20, initialIndex: 0 }) {
					ListItem() {
						Text('item1')
							.width('100%')
							.textAlign(TextAlign.Center)
							.backgroundColor(Color.White)
					}
						
						.attributeModifier(this._tabIndexListItemModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'ListItemGroup') {
				List({ space: 0, initialIndex: 0 }) {
					ListItemGroup()
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._tabIndexListItemGroupModifier)
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
					
					.attributeModifier(this._tabIndexRefreshModifier)
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
					
					.attributeModifier(this._tabIndexRelativeContainerModifier)
			}
			if (this.targetView == 'Row') {
				Row()
					
					.attributeModifier(this._tabIndexRowModifier)
			}
			if (this.targetView == 'RowSplit') {
				RowSplit() {
					Text('Text')
				}
					
					.attributeModifier(this._tabIndexRowSplitModifier)
			}
			if (this.targetView == 'Scroll') {
				Scroll() {
					Column() {
						ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
							Text('Scroll' + item.toString())
								.width('90%')
								.height(50)
								.backgroundColor(Color.White)
								.textAlign(TextAlign.Center)
						}, (item: int) => item.toString())
					}
					.width('100%')
				}
					.scrollBar(BarState.On)
					
					.attributeModifier(this._tabIndexScrollModifier)
			}
			if (this.targetView == 'SideBarContainer') {
				SideBarContainer(SideBarContainerType.Embed) {
					Column() {
						ForEach([1, 2, 3], (item: int) => {
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
					
					.attributeModifier(this._tabIndexStackModifier)
			}
			if (this.targetView == 'Swiper') {
				Swiper() {
					ForEach([1, 2, 3], (item: int) => {
						Text('Swiper' + item)
							.width('90%')
							.height(50)
					}, (item: int) => item.toString())
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
					
					.attributeModifier(this._tabIndexTabsModifier)
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
						
						.attributeModifier(this._tabIndexTabContentModifier)
				}
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'WaterFlow') {
				WaterFlow() {
					ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
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
					}, (item: int) => item.toString())
				}
					
					.attributeModifier(this._tabIndexWaterFlowModifier)
			}
			if (this.targetView == 'GridCol') {
				GridRow({ columns: 1, direction: GridRowDirection.Row }) {
					GridCol() {
						Row()
							.width('100%')
							.height('20vp')
					}
						.backgroundColor(Color.Yellow)
						
						.attributeModifier(this._tabIndexGridColModifier)
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
						
						.attributeModifier(this._tabIndexGridItemModifier)
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'FlowItem') {
				WaterFlow() {
					ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: int) => {
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
						
						.attributeModifier(this._tabIndexFlowItemModifier)
					}, (item: int) => item.toString())
				}
					.backgroundColor(Color.Pink)
					.width('100%')
					.height('100%')
			}
			if (this.targetView == 'MenuItem') {
				Row() {
					Menu() {
						MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
							
							.attributeModifier(this._tabIndexMenuItemModifier)
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
							
							.attributeModifier(this._tabIndexMenuItemGroupModifier)
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
					
					.attributeModifier(this._tabIndexCalendarPickerModifier)
			}
			if (this.targetView == 'Canvas') {
				Canvas(new CanvasRenderingContext2D(new RenderingContextSettings(true)))
					.backgroundColor('#FFFF00')
					
					.attributeModifier(this._tabIndexCanvasModifier)
			}
			if (this.targetView == 'FormLink') {
				FormLink({
					action: "router",
					abilityName: "EntryAbility",
          params: { message: 'testForRouter' } as ObjElement
        } as FormLinkOptions) {
					Button("router event").width(120)
				}
					
					.attributeModifier(this._tabIndexFormLinkModifier)
			}
			if (this.targetView == 'Hyperlink') {
				Hyperlink('https://example.com/', 'Go to the developer website') {
				}
					
					.attributeModifier(this._tabIndexHyperlinkModifier)
			}
			if (this.targetView == 'Span') {
				Text() {
					Span('Span1')
						
						.attributeModifier(this._tabIndexSpanModifier)
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