# FrameworkLoaderApp

An iOS app that attemps to dynamically load (at runtime) two frameworks:

* Objective-C framework
* Swift framework

On success the app attempts to execute each framework code.

Requires two other repositories as separate projects:

[FrameworkObjC](https://github.com/deze333/FrameworkObjC)

[FrameworkSwift](https://github.com/deze333/FrameworkSwift)

## Important note

To make sure that principal class works for the Swift framework, its name in `Info.plist` should be of format "ModuleName.ClassName".
In this case:

```
<string>FrameworkSwift.PluginSwift</string>
```

