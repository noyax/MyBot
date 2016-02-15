; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Milking
; Description ...: This file Includes GUI Milking
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: Noyax37
; Modified ......: 
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2016
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

;~ -------------------------------------------------------------
;~ Milking Tab
;~ -------------------------------------------------------------
$tabMilking = GUICtrlCreateTabItem("Milking")
	Local $x = 30, $y = 150
	$grpMilking = GUICtrlCreateGroup("Milking Parameters", $x - 20, $y - 20, 450, 375)
		$lblcommon = GUICtrlCreateLabel("***** Common to 2 Milking methods (Scripted and new below)*****", $x , $y + 3)
		$y += 23
		$chkDBAttMilk = GUICtrlCreateCheckbox( "Milking with", $x, $y, -1, -1)
			$txtTip = "Use Gobelins Power to try Milking."
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_CHECKED)
			GUICtrlSetOnEvent(-1, "milkingatt")
		$txtDBAttMilk = GUICtrlCreateInput("90", $x + 75, $y + 3, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Number of troops used for milking attack"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 5)
			_GUICtrlEdit_SetReadOnly(-1, False)
		$lblDBAttMilkDB = GUICtrlCreateLabel("Troops in camps before 1st attack", $x + 102, $y + 3)
		$y += 23
		$lblHysterGobs = GUICtrlCreateLabel("Nb troops mini in camps before re-train:", $x - 5 , $y + 3)
		$txtchkHysterGobs = GUICtrlCreateInput("40", $x + 200, $y , 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Number min of troops before train again"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 3)
			_GUICtrlEdit_SetReadOnly(-1, False)
		$y += 21
		$lblTempoTrain = GUICtrlCreateLabel("Nb minutes max between 2 training:", $x - 5 , $y + 3)
;		$y += 23
		$txtchkTempoTrain = GUICtrlCreateInput("15", $x + 200, $y , 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Number minutes max between 2 trains troops"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 3)
			_GUICtrlEdit_SetReadOnly(-1, False)
		$y += 23
		$lblnew = GUICtrlCreateLabel("****** Scripted method, use only if scripted attack is chosen *******", $x , $y + 3)
		$y += 23
		$lblPixelmaxExposed2 = GUICtrlCreateLabel("Nb pixels to redline to consider exposed:", $x - 5 , $y )
		$txtchkPixelmaxExposed2 = GUICtrlCreateInput("40", $x + 200, $y , 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Number min of Pixels to considere collectors exposed"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 3)
			_GUICtrlEdit_SetReadOnly(-1, False)
		$y += 23
		$lblPixelmaxExposed2 = GUICtrlCreateLabel("Nb pixels between center of collector to the redline, higher is this number", $x - 5 , $y )
		$y += 23
		$lblPixelmaxExposed2 = GUICtrlCreateLabel(" more chance you have to fail attack. 25 seems to be the minimum but too strict. 40 seems good result.", $x - 5 , $y )
		$y += 40
		$lblnew = GUICtrlCreateLabel("****** New method, inactivates if scripted attack is chosen. It's for future update *******", $x , $y + 3)
		$y += 23
		$lblPixelmaxExposed = GUICtrlCreateLabel("Nb tiles to redline to consider exposed:", $x - 5 , $y )
		$txtchkPixelmaxExposed = GUICtrlCreateInput("1", $x + 200, $y , 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Number min of Tiles to considere collectors exposed"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 3)
			_GUICtrlEdit_SetReadOnly(-1, False)
		$y += 21
		$txtDBUseGobsForCollector = GUICtrlCreateInput("5", $x, $y, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			$txtTip = "Bot tries to use X amount of Goblins to attack each exposed collector"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 3)
			_GUICtrlEdit_SetReadOnly(-1, False)
		$lblUseForColl2 = GUICtrlCreateLabel("Gobs / collectors" , $x + 30, $y, -1, -1)
		$y += 26
		$chkMilkAttackNearGoldMine = GUICtrlCreateCheckbox("", $x + 20, $y, 17, 17)
			$txtTip = GetTranslated(3,37, "Drop troops near Gold Mines")
			GUICtrlSetTip(-1, $txtTip)
		$picMilkAttackNearGoldMine = GUICtrlCreateIcon($pIconLib, $eIcnMine, $x + 40 , $y - 3 , 24, 24)
			GUICtrlSetTip(-1, $txtTip)
		$chkMilkAttackNearElixirCollector = GUICtrlCreateCheckbox("", $x + 75, $y, 17, 17)
			$txtTip = GetTranslated(3,38, "Drop troops near Elixir Collectors")
			GUICtrlSetTip(-1, $txtTip)
		$picMilkAttackNearElixirCollector = GUICtrlCreateIcon($pIconLib, $eIcnCollector, $x + 95 , $y - 3 , 24, 24)
			GUICtrlSetTip(-1, $txtTip)
  		$chkMilkAttackNearDarkElixirDrill = GUICtrlCreateCheckbox("", $x + 130, $y, 17, 17)
			$txtTip = GetTranslated(3,39, "Drop troops near Dark Elixir Drills")
 			GUICtrlSetTip(-1, $txtTip)
		$picMilkAttackNearDarkElixirDrill = GUICtrlCreateIcon($pIconLib, $eIcnDrill, $x + 150 , $y - 3, 24, 24)
 			GUICtrlSetTip(-1, $txtTip)
		$y += 40
		$lblnew = GUICtrlCreateLabel("****** Option TH Snipe. Not active now, it's for future update *******", $x , $y + 3)
		$y += 23
		$chkAttIfDB = GUICtrlCreateCheckbox("Attack if loots <", $x  , $y, -1, -1)
			$txtTip = "Attack if TH Snipe found dead base"
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetState(-1, $GUI_ENABLE)
		$lblAttIfDB = GUICtrlCreateLabel("% of total loots", $x + 125, $y+5, -1, 17)
		    GUICtrlSetTip(-1, $txtTip)
		$txtAttIfDB = GUICtrlCreateInput("10", $x + 95, $y + 1, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
			GUICtrlSetTip(-1, $txtTip)
			GUICtrlSetLimit(-1, 2)
			GUICtrlSetState(-1, $GUI_ENABLE)

	GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
