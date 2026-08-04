'use static';
import IntlFormatterInterfaceTest from "./INTL/IntlFormatterInterfaceTest.test"
import IntlIntlBestFitLocalesTest from "./INTL/IntlIntlBestFitLocalesTest.test"
import IntlIntlBestFitLocaleTest from "./INTL/IntlIntlBestFitLocaleTest.test"
import IntlIntlLocalesToLanguageTagsTest from "./INTL/IntlIntlLocalesToLanguageTagsTest.test"
import IntlIntlLookUpLocalesTest from "./INTL/IntlIntlLookUpLocalesTest.test"
import IntlIntlLookUpLocaleTest from "./INTL/IntlIntlLookUpLocaleTest.test"
import IntlOverallTest from "./INTL/IntlOverallTest.test"
import IntlSupplementalTest from "./INTL/IntlSupplementalTest.test"
export default function testsuite():void {
  IntlFormatterInterfaceTest()
  IntlIntlBestFitLocalesTest()
  IntlIntlBestFitLocaleTest()
  IntlIntlLocalesToLanguageTagsTest()
  IntlIntlLookUpLocalesTest()
  IntlIntlLookUpLocaleTest()
  IntlOverallTest()
  IntlSupplementalTest()
}

