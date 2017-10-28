/**
 * Created by zmd on 2016/12/13.
 */
includeTargets << new File(msbasePluginDir, 'scripts/_Generate.groovy')

target(msGenerateJoinTable: "The description of the script goes here!") {
    depends(checkVersion, parseArguments, packageApp)
    promptForName(type: "Domain Class")
    generateForName = argsMap['params'][0]
    generateForName2 = argsMap['params'][1]
    generateController=false
    generateViews=false
    generateJoinTable = true
    generateForTwo()
}

setDefaultTarget 'msGenerateJoinTable'