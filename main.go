package main

import (
    "os"

    "github.com/diamondburned/gotk4/pkg/gdk/v4"
    "github.com/diamondburned/gotk4/pkg/gtk/v4"
)

func main() {
    app := gtk.NewApplication("com.example.hello-gtk4", 0)

    app.ConnectActivate(func() {
        win := gtk.NewApplicationWindow(app)
        win.SetTitle("Hello GTK4 (Go) fuck")
        win.SetDefaultSize(400, 200)

        label := gtk.NewLabel("Hello")
        win.SetChild(label)

        win.Present()
    })

    os.Exit(app.Run(os.Args))
    _ = gdk.BUTTON_PRIMARY
}
