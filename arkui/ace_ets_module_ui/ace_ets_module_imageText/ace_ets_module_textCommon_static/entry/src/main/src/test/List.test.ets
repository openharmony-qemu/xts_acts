'use static';
import TextCommonTest from './TextCommonTest/TextCommon.test';
import TextCommonUITest from './TextCommonTest/TextCommonUI.test';
import EditDecorationThicknessScaleTest from './EditCommonTest/EditDecorationThicknessScale.test';
import SetTextSelectionClearPolicyTest from './UIContext/SetTextSelectionClearPolicy.test';
import TextSymbolWithEnvFontScaleTest from './WithEnvTest/TextSymbolWithEnvFontScale.test';
import TextMenuItemIdTest from './TextMenuItemIdTest/TextMenuItemId.test';
import DisableMenuItemsTest from './UIContext/DisableMenuItems.test';

export default function testsuite() {
  TextCommonTest();
  TextCommonUITest();
  EditDecorationThicknessScaleTest();
  SetTextSelectionClearPolicyTest();
  TextSymbolWithEnvFontScaleTest();
  DisableMenuItemsTest();
}