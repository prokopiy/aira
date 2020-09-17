(defmodule wxtest
    (export all))

(defun create_window [Wx]
    (let* [
           (Frame (wxFrame:new Wx -1 "Hello world" (list (tuple 'size (tuple 600 400)))))]
        (progn
            (wxFrame:createStatusBar Frame '())
            (wxFrame:connect Frame 'close_window)
            (wxFrame:connect Frame 'leave_window)
            
            Frame))
    )



(defun loop [Frame]
    (receive
        ((tuple 'wx _ _ _ (tuple 'wxClose 'close_window))
            (lfe_io:format "Close window...~n" ())
            (let* [(ok (wxFrame:setStatusText Frame "Closing..." '[]))
                   (var2 'init-form-2)]
                (wxWindow:destroy Frame)
                ok)

            )
        (Msg (when (is_tuple Msg))
            (lfe_io:format "TUPLE: ~w ~n" (list Msg))   
            (loop Frame))
            
        (Msg
            (lfe_io:format "MSG: ~p ~n" (list Msg))
            (loop Frame) )

    ))

; #(wx -2006 #(wx_ref 35 wxFrame ()) () #(wxClose close_window)) 

(defun start []
    (let* [(Wx (wx:new))
           (Frame (wx:batch (lambda () (create_window Wx))))]
        (progn
            (wxWindow:show Frame)
            (loop Frame)
            (wx:destroy)
        )
        )
    )

