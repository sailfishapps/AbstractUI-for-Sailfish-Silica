import QtQuick 1.1
//import com.nokia.meego 1.0
import org.flyingsheep.abstractui 1.0

//This demo project shows how an AbstractUI abstracted Menu works
// and that it runs on both Harmattan and SailfishOS targets.
//It is intended to contrast with the HarmattanMenuDemo
//and SailfishOSMenuDemo projects which implement native menu handling

//Just a thought: how do I distinguish between
//a) standard QtQuick components
//b) com.nokia.meego ?
//The latter should be abstracted out, the former not!


AUIPageStackWindow {
    id: appWindow

    initialPage: mainPage

    MainPage {
        id: mainPage
    }

    //In the native Harmattan native implementation the controls ToolBarLayout and Menu would be here.
    //In this abstracted implementation, these controls are now in MainPage / AUIPage

}
