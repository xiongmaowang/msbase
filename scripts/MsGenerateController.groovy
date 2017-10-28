/**
 * Created by zmd on 2016/11/20.
 */
includeTargets << new File(msbasePluginDir, 'scripts/_Generate.groovy')

target(msGenerateController: "The description of the script goes here!") {
    depends(checkVersion, parseArguments, packageApp)
    promptForName(type: "Domain Class")
    String name = argsMap['params'][0]
    generateViews=false
    if ( name == '*') {
        uberGenerate()
    }
    else {
        generateForName = name
        generateForOne()
    }
}
setDefaultTarget 'msGenerateController'
