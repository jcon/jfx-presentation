package presentation.events;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.*;
import javafx.scene.text.Text;
import javafx.scene.input.MouseEvent;
import javafx.scene.paint.Color;
import javafx.scene.input.KeyEvent;

var message: String = "";
var text = Text {
    x: 150, y: 150
    content: bind "{message}";
}

var rect = Rectangle {
    x: 150,
    y: 10
    width: 100,
    height: 100
    fill: Color.ROYALBLUE
    onMouseMoved: function( e: MouseEvent ):Void {
        message = "mouse moved!"
    }
    onMouseClicked: function( e: MouseEvent ):Void {
        message = "mouse clicked!"
    }
    onMousePressed: function( e: MouseEvent ):Void {
        message = "mouse pressed!"
    }
    onMouseExited: function( e: MouseEvent ):Void {
        message = "mouse exited!"
    }
    onKeyPressed: function( e: KeyEvent ):Void {

    }
};


Stage {
    title: "Mouse Demo"
    width: 400
    height: 600
    scene: Scene {
        content: [
            rect,
            text
        ]
    }
}