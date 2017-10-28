/**
 * Created by zmd on 2016/12/2.
 */
includeTargets << new File(msbasePluginDir, 'scripts/_Generate.groovy')

target(msGenerateAll: "The description of the script goes here!") {
    depends(checkVersion, parseArguments, packageApp)
    promptForName(type: "Domain Class")
    String name = argsMap['params'][0]
    if ( name == '*') {
        uberGenerate()
    }
    else {
        generateForName = name
        generateForOne()
    }
}

setDefaultTarget 'msGenerateAll'
