package presentation.c08;

import javafx.ext.swing.SwingLabel;
import javafx.ext.swing.SwingTextField;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.ext.swing.SwingButton;

// SwingTextFields wrap JTextFields.
//
// Provide helpful attributes for manipulating the underlying JTextField
var name: SwingTextField = SwingTextField {
    columns: 25
};

var state: SwingTextField = SwingTextField {
    columns: 4
};


Stage {
    title : "SimpleForm"
    scene: Scene {
        width: 400
        height: 600
        content: [
            VBox {
                translateX: 50
                translateY: 100
                content: [
                    // Row 1
                    HBox {
                        content: [
                            SwingLabel {
                                labelFor: name
                                text: "Name:"
                            },
                            name
                        ]
                    },
                    // Row 2
                    HBox {
                        content: [
                            SwingLabel {
                                labelFor: state
                                text: "State:"
                            },
                            state
                        ]
                    },
                    // Row 3
                    HBox {
                        content: [
                            SwingButton {
                                text: "Save"
                                action: function() {
                                    // we could have done something with these values such
                                    // as save to a DB
                                    println("saving first={name.text} state={state.text}")
                                }
                            },
                            SwingButton {
                                text: "Cancel"
                                action: function() {
                                    println("cancel changes first={name.text} state={state.text}")
                                }
                            }
                        ]
                    }
                ]
            }
        ]
    }
}
