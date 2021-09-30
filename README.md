# XCUITest examples

> **For Demonstration Purposes Only**\
> The code in these scripts is provided on an "AS-IS" basis without warranty of any kind, either express or implied,
> including without limitation any implied warranties of condition, uninterrupted use, merchantability, fitness for a
> particular purpose, or non-infringement. These scripts are provided for educational and demonstration purposes only, 
> and should not be used in production. Issues regarding these scripts should be submitted through GitHub. These scripts
> are maintained by the Technical Services team at Sauce Labs.

## Introduction
This repository will hold multiple examples on how to run XCUITests tests on the Sauce Labs cloud.
More information on how to use it can be found below.

> **NOTE:** If you want to see examples using the Legacy RDC then please check the 
> [Legacy RDC](https://github.com/saucelabs-training/demo-xcuitest/tree/legacy-rdc) branch. Mind the fact that the 
> Legacy RDC will be EOL in September 2021. 

## Prerequisites
- Please check our [documentation](https://docs.saucelabs.com/testrunner-toolkit/installation) for installing SauceCTL
- Make sure you've set up your credentials on your local machine and or CI-pipeline, see
  [this](https://docs.saucelabs.com/testrunner-toolkit/installation#associating-your-sauce-labs-account)-doc
- Check the [XCUITest](https://docs.saucelabs.com/testrunner-toolkit/configuration/xcuitest/index.html)-docs for all options

### Install `saucectl`
```shell
curl -L https://saucelabs.github.io/saucectl/install | bash
```

> ⚠️ Make sure saucectl version is newer than **v0.44.0**

## Apps
A prebuilt native iOS application and it's XCUITests test cases are included in this repo. Source to this application
can be found on GitHub in this [folder](https://github.com/saucelabs/sample-app-mobile/tree/master/ios/SwagLabsMobileAppUITests/).
The two test-classes can be found here:

- [SwagLabsMobileAppUITests.LoginTest](https://github.com/saucelabs/sample-app-mobile/blob/master/ios/SwagLabsMobileAppUITests/LoginTests.swift)
- [SwagLabsMobileAppUITests.SwagLabsFlow](https://github.com/saucelabs/sample-app-mobile/blob/master/ios/SwagLabsMobileAppUITests/SwagLabsFlow.swift)

The application is bundled in [`SauceLabs.Mobile.Sample.XCUITest.App.ipa`](./apps/SauceLabs.Mobile.Sample.XCUITest.App.ipa)
and the tests cases are bundled in [`SwagLabsMobileAppUITests-Runner.app`](./apps/SwagLabsMobileAppUITests-Runner.app).


## Examples
All below mentioned examples can be found in the [`.sauce`](/.sauce)-folder. You can run the configurations by running
the following command from the root of this folder

      saucectl run --config ./.sauce/runner-ex{#}.yml

The `#` stands for the number of the below mentioned examples.

### Example 1 - Minimal configuration for all tests
[`runner-ex1.yml`](/.sauce/runner-ex1.yml) provides a minimum configuration needed to run the XCUITest tests.
In this example, all test cases are executed on a single, available device in sequential order.\
[![XCUITest - Example 1](https://github.com/saucelabs-training/demo-xcuitest/actions/workflows/example-1.yml/badge.svg)](https://github.com/saucelabs-training/demo-xcuitest/actions/workflows/example-1.yml)

### Example 2 - Minimal configuration for 2 tests
[`runner-ex2.yml`](/.sauce/runner-ex2.yml) provides a minimum configuration needed to run the XCUITest tests.
In this example, there are two test cases from one class executed on a single, available device in sequential order.\
[![XCUITest - Example 2](https://github.com/saucelabs-training/demo-xcuitest/actions/workflows/example-2.yml/badge.svg)](https://github.com/saucelabs-training/demo-xcuitest/actions/workflows/example-2.yml)

### Example 3 - Run each test on its own device
[`runner-ex3.yml`](/.sauce/runner-ex3.yml) breaks apart the execution of the two test cases such that they can run in 
parallel on separate devices that are available (ie., not in use) in the pool.\
[![XCUITest - Example 3](https://github.com/saucelabs-training/demo-xcuitest/actions/workflows/example-3.yml/badge.svg)](https://github.com/saucelabs-training/demo-xcuitest/actions/workflows/example-3.yml)

### Example 4 - Run in parallel on hard-coded devices
[`runner-ex4.yml`](/.sauce/runner-ex4.yml) modifies the second example by specifying which *hardcoded/fixed* device in 
the pool to execute each test on. This is called static allocation. Still uses parallel execution.\
[![XCUITest - Example 4](https://github.com/saucelabs-training/demo-xcuitest/actions/workflows/example-4.yml/badge.svg)](https://github.com/saucelabs-training/demo-xcuitest/actions/workflows/example-4.yml)

### Example 5 - Parallel execution using dynamic devices
[`runner-ex5.yml`](/.sauce/runner-ex5.yml) uses the `dynamic` capability to look for available devices using wildcard 
names. This example demonstrates the ability to run a specified test(s) on a pool devices that are configured the same 
but have different names for parallel processing.\
[![XCUITest - Example 5](https://github.com/saucelabs-training/demo-xcuitest/actions/workflows/example-5.yml/badge.svg)](https://github.com/saucelabs-training/demo-xcuitest/actions/workflows/example-5.yml)

### Example 6 - Parallel execution by platform version
[`runner-ex6.yml`](/.sauce/runner-ex6.yml) uses only the `platformVersion` field to select an available device.
Demonstrates the ability to pick a specific version of iOS from the pool of devices for executing tests in parallel.\
[![XCUITest - Example 6](https://github.com/saucelabs-training/demo-xcuitest/actions/workflows/example-6.yml/badge.svg)](https://github.com/saucelabs-training/demo-xcuitest/actions/workflows/example-6.yml)
