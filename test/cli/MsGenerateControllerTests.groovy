import grails.test.AbstractCliTestCase

class MsGenerateControllerTests extends AbstractCliTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testMsGenerateController() {

        execute(["ms-generate-controller"])

        assertEquals 0, waitForProcess()
        verifyHeader()
    }
}
