import inputMethodTest from "./InputMethodJsUnit.test";
import inputMethodShowHideTest from "./InputMethodTextInput.test"
import inputMethodAttachTest from "./InputMethodAttach.test"
import inputMethodOnOffTest from "./InputMethodOnOff.test"
import inputMethodOnErrorEtsTest from './InputmethodErrorCode.test'
export default function testsuite() {
    inputMethodTest();
    inputMethodShowHideTest();
    inputMethodAttachTest();
    inputMethodOnOffTest();
    inputMethodOnErrorEtsTest();
}
