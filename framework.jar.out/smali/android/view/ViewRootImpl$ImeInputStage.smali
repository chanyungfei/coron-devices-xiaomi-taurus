.class final Landroid/view/ViewRootImpl$ImeInputStage;
.super Landroid/view/ViewRootImpl$AsyncInputStage;
.source "ViewRootImpl.java"

# interfaces
.implements Landroid/view/inputmethod/InputMethodManager$FinishedInputEventCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/view/ViewRootImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ImeInputStage"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/view/ViewRootImpl;


# direct methods
.method public constructor <init>(Landroid/view/ViewRootImpl;Landroid/view/ViewRootImpl$InputStage;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "next"
    .parameter "traceCounter"

    .prologue
    .line 3680
    iput-object p1, p0, Landroid/view/ViewRootImpl$ImeInputStage;->this$0:Landroid/view/ViewRootImpl;

    .line 3681
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewRootImpl$AsyncInputStage;-><init>(Landroid/view/ViewRootImpl;Landroid/view/ViewRootImpl$InputStage;Ljava/lang/String;)V

    .line 3682
    return-void
.end method


# virtual methods
.method public onFinishedInputEvent(Ljava/lang/Object;Z)V
    .locals 2
    .parameter "token"
    .parameter "handled"

    .prologue
    .line 3711
    move-object v0, p1

    check-cast v0, Landroid/view/ViewRootImpl$QueuedInputEvent;

    .line 3712
    .local v0, q:Landroid/view/ViewRootImpl$QueuedInputEvent;
    if-eqz p2, :cond_0

    .line 3713
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewRootImpl$ImeInputStage;->finish(Landroid/view/ViewRootImpl$QueuedInputEvent;Z)V

    .line 3717
    :goto_0
    return-void

    .line 3716
    :cond_0
    invoke-virtual {p0, v0}, Landroid/view/ViewRootImpl$ImeInputStage;->forward(Landroid/view/ViewRootImpl$QueuedInputEvent;)V

    goto :goto_0
.end method

.method protected onProcess(Landroid/view/ViewRootImpl$QueuedInputEvent;)I
    .locals 6
    .parameter "q"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 3686
    iget-object v5, p0, Landroid/view/ViewRootImpl$ImeInputStage;->this$0:Landroid/view/ViewRootImpl;

    iget-boolean v5, v5, Landroid/view/ViewRootImpl;->mLastWasImTarget:Z

    if-eqz v5, :cond_0

    iget-object v5, p0, Landroid/view/ViewRootImpl$ImeInputStage;->this$0:Landroid/view/ViewRootImpl;

    #calls: Landroid/view/ViewRootImpl;->isInLocalFocusMode()Z
    invoke-static {v5}, Landroid/view/ViewRootImpl;->access$700(Landroid/view/ViewRootImpl;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 3687
    invoke-static {}, Landroid/view/inputmethod/InputMethodManager;->peekInstance()Landroid/view/inputmethod/InputMethodManager;

    move-result-object v1

    .line 3688
    .local v1, imm:Landroid/view/inputmethod/InputMethodManager;
    if-eqz v1, :cond_0

    .line 3689
    iget-object v0, p1, Landroid/view/ViewRootImpl$QueuedInputEvent;->mEvent:Landroid/view/InputEvent;

    .line 3691
    .local v0, event:Landroid/view/InputEvent;
    iget-object v5, p0, Landroid/view/ViewRootImpl$ImeInputStage;->this$0:Landroid/view/ViewRootImpl;

    iget-object v5, v5, Landroid/view/ViewRootImpl;->mHandler:Landroid/view/ViewRootImpl$ViewRootHandler;

    invoke-virtual {v1, v0, p1, p0, v5}, Landroid/view/inputmethod/InputMethodManager;->dispatchInputEvent(Landroid/view/InputEvent;Ljava/lang/Object;Landroid/view/inputmethod/InputMethodManager$FinishedInputEventCallback;Landroid/os/Handler;)I

    move-result v2

    .line 3693
    .local v2, result:I
    const/16 v5, 0x63

    if-ne v2, v5, :cond_1

    .line 3706
    .end local v0           #event:Landroid/view/InputEvent;
    .end local v1           #imm:Landroid/view/inputmethod/InputMethodManager;
    .end local v2           #result:I
    :cond_0
    :goto_0
    return v3

    .line 3697
    .restart local v0       #event:Landroid/view/InputEvent;
    .restart local v1       #imm:Landroid/view/inputmethod/InputMethodManager;
    .restart local v2       #result:I
    :cond_1
    if-ne v2, v4, :cond_2

    move v3, v4

    .line 3698
    goto :goto_0

    .line 3699
    :cond_2
    if-nez v2, :cond_3

    .line 3700
    const/4 v3, 0x2

    goto :goto_0

    .line 3702
    :cond_3
    const/4 v3, 0x3

    goto :goto_0
.end method
