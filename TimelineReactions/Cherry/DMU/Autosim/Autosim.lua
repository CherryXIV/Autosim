local tbl = 
{
	
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local acr = TensorCore.API.TensorACR\n\n-- AoE target-count phase types. P3 cleave windows set these to 2.\n--[[\nlocal aoeTypes = {\n    \"SelfCircle5Yd\", \"SelfCircle8Yd\", \"Cone8Yd\", \"Line10Yd\", \"Line15Yd\",\n    \"TargetCircle5YdRange3Yd\", \"TargetCircle5YdRange5Yd\",\n    \"TargetCircle5YdRange20Yd\", \"TargetCircle5YdRange25Yd\",\n}\n]]--\n\nlocal aoeTypes = {\n    \"SelfCircle5Yd\", \"TargetCircle5YdRange20Yd\"\n}\n\nacr.clearAutoSimPhases(\"FullDowntime\")\nd(\"FullDowntime cleared\")\nacr.clearAutoSimPhases(\"MeleeDowntime\")\nd(\"MeleeDowntime cleared\")\nacr.clearAutoSimPhases(\"Stun\")\nd(\"Stun cleared\")\nacr.clearAutoSimPhases(\"RaidBuff\")\nd(\"RaidBuff cleared\")\nacr.clearAutoSimPhases(\"BossModifier\")\nd(\"BossModifier cleared\")\n\nfor i = 1, #aoeTypes do\n    acr.clearAutoSimPhases(aoeTypes[i])\nend\nd(\"AoE phases cleared\")\n\nacr.clearAutoSimUncertainty() --If this isn't done, errors are thrown\nd(\"Uncertainty cleared\")\n--acr.clearAutoSimPhases(\"CasterDowntime\")\n--acr.clearAutoSimPhases(\"TargetLifetime\", 0)\n--acr.clearAutoSimPhases(\"DotAvailability\", 0)\n\nacr.setAutoSimKillTime(1116)       -- measured: 1116.11 and 1116.25 on two clears\nd(\"set Autosim kill time\")\nacr.addAutoSimUncertainty(727, 3)  -- the P3 push: Exdeath untargetable, mean 727.05 over 42 pulls\nd(\"set uncertainty\")\n\n-- { phaseType, startTime, endTime, value, targetSlot }\nlocal phases = {\n    -- Nothing is targetable.\n    { \"FullDowntime\", 197.5, 207.9 },   -- Kefka untargetable, P1 -> P2\n\n    -- P2 -> P3. Kefka leaves at 381.5 but players can still act until Kefka's\n    -- stun (774) lands at ~387.8; casting resumes ~420.3, bosses at 427.5.\n    { \"FullDowntime\", 380.5, 427.5 },\n    { \"Stun\",         387.9, 420.3 },\n\n    -- The player cannot act.\n    -- Idyllic Will (cast 173.4): Graven Image puts sleep (4894) on half the\n    { \"Stun\", 174.3, 180.3 },\n\n    -- Raid buffs, the whole fight. Two-minute party cooldowns on the COMBAT\n    -- clock, so they deliberately do NOT take the P4 timeline offset: they come\n    -- back on schedule no matter how the boss timeline shifted.\n    { \"RaidBuff\",  1.0,    21.115, 1.3 },\n    { \"RaidBuff\",  122.5,  142.5,  1.3 },\n    { \"RaidBuff\",  243.15, 262.21, 1.3 },\n    { \"RaidBuff\",  353,    380,    1.2 },\n    { \"RaidBuff\",  484.70, 502.52, 1.3 },\n    { \"RaidBuff\",  604.73, 623.7,  1.3 },\n    { \"RaidBuff\",  725.77, 745.41, 1.3 },\n    { \"RaidBuff\",  845.9,  865.8,  1.3 },\n    { \"RaidBuff\",  968.34, 987,    1.3 },\n    { \"RaidBuff\",  1088.2, 1102.5, 1.3 },\n\t\n\t-- Boss Modifier\n\t-- Independently tracked on this so we can keep our Raid Buffs.\n\t--{ \"BossModifier\", 322.4, 381.5, 0.8 },\n\t{ \"BossModifier\", 475, 515, 1.2 },\n\n    -- Higanbana. Lifetime and availability track each other: a target you cannot\n    -- reach is not worth planning a DoT into. Kefka through 381.5, then\n    -- Chaos/Exdeath from 427.5 until Exdeath dies ~729.\n    --[[{ \"TargetLifetime\",    0.0, 197.5, 1, 0 },\n    { \"TargetLifetime\",  207.9, 381.5, 1, 0 },\n    { \"TargetLifetime\",  427.5, 729.0, 1, 0 },\n    { \"DotAvailability\",   0.0, 197.5, 1, 0 },\n    { \"DotAvailability\", 207.9, 381.5, 1, 0 },\n    { \"DotAvailability\", 427.5, 729.0, 1, 0 },\n\t]]--\n}\n\nfor i = 1, #phases do\n    local p = phases[i]\n    acr.addAutoSimPhase(p[1], p[2], p[3], p[4], p[5])\n\td(p[1] .. \" added\")\nend\n\n-- P1 from the first Tele-trouncing cast (151.5) to Kefka leaving (197.5).\n-- The ID is kept so [AutoSim] P1 Low HP can lower this same phase in place\n-- once Kefka is low; a second BossModifier over the same window would overlap.\ndata.Cherry_AutoSimP1ModID = acr.addAutoSimPhase(\"BossModifier\", 151.5, 197.5, 0.8)\nd(\"P1 BossModifier added, id \" .. tostring(data.Cherry_AutoSimP1ModID))\n\n-- P2: the last 5s before Kefka leaves (381.5) at 0.5x. Kept so [AutoSim] P2 Low\n-- HP can drop this same phase to 0 once Kefka is at 0.1%.\ndata.Cherry_AutoSimP2ModID = acr.addAutoSimPhase(\"BossModifier\", 376.5, 381.5, 0.5)\nd(\"P2 BossModifier added, id \" .. tostring(data.Cherry_AutoSimP2ModID))\n\n-- Rough P3 -> P4 and P4 -> P5 downtimes so AutoSim plans for them from the pull.\n-- Exdeath goes untargetable at 727.05 on average (42 pulls) and Kefka appears\n-- 4.45s later at timeline 801.9, so P4/P5 timeline times + predicted offset.\n-- [AutoSim] P4 Start moves these same phases onto the real times.\nlocal P3_END   = 727.05\nlocal predOffs = P3_END + 4.45 - 801.9\ndata.Cherry_AutoSimPred = {\n    offset = predOffs,\n    p3p4   = acr.addAutoSimPhase(\"FullDowntime\", P3_END, 801.9 + predOffs),\n    p4p5   = acr.addAutoSimPhase(\"FullDowntime\", 934.7 + predOffs, 965.7 + predOffs),\n}\nd(string.format(\"Predicted P4 offset %+.2f\", predOffs))\n\n-- P3 padding up to limit cut (Ultima Blaster, 521.4): Chaos and Exdeath stacked\n-- within 6y (>=80% of 42 P3 clears, measured 2026-09-28), so AoE hits both.\n-- Only outside the Fated/Fabled Hero window: Anyone disables AOE at 430.6 when\n-- the hero buffs lock each player to one boss and re-enables it at 469.2, so\n-- the 437-457 stack does not count.\n\nlocal cleaveWindows = {\n    { 486, 513 },\n}\n\nfor i = 1, #cleaveWindows do\n    local w = cleaveWindows[i]\n    for j = 1, #aoeTypes do\n        acr.addAutoSimPhase(aoeTypes[j], w[1], w[2], 2)\n    end\nend\nd(\"P3 cleave windows added\")\n\n\nd(\"Autosim Opti added\")\n\nself.used = true\n\n",
							uuid = "a26aaf06-e23a-f2b6-bd46-631cfdfa5694",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				eventType = 16,
				mechanicTime = 15.261765625,
				name = "[AutoSim] Start",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 5,
				timerStartOffset = -46,
				uuid = "42382074-44ad-92ee-bf3a-657f792ecc71",
				version = 2,
			},
			inheritedIndex = 1,
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "-- Clocks, and what [AutoSim] P4 Start synced to (data.Cherry_AutoSimP4).\n-- Checkpoints are filled by [AutoSim] P4 Checkpoints.\n-- Also owns the LB3 toggles and keeps their stuns scheduled (rec.lb).\nlocal acr      = TensorCore.API.TensorACR\nlocal now      = acr.getAutoSimTime()\nlocal timeline = TensorReactions_CurrentTimer or 0\nlocal combat   = TensorReactions_CurrentCombatTimer or 0\n\nlocal rec = data.Cherry_AutoSimP4\nif rec and now < rec.exdeathAt then\n    rec = nil   -- left over from an earlier pull\nend\n\n-- LB3 toggles, read by [AutoSim] P4 LB3 and [AutoSim] P5 LB3. Global so they\n-- survive wipes; a Lua reload resets both to off.\nCherry_AutoSimLB = Cherry_AutoSimLB or { p4 = false, p5 = false }\nlocal lb = Cherry_AutoSimLB\n\n-- Each ticked LB3 gets its Stun scheduled in advance at its timeline cast start\n-- + offset, so AutoSim plans around it. Unticking removes it. Once the cast\n-- really starts, [AutoSim] LB3 Stun Sync claims the phase and moves it onto the\n-- real cast; after that it is left alone. A slot whose LB window passes with no\n-- cast is removed (the LB never went off).\n-- tl: LB3 cast start (P4 LB3 fires at 850.93, 1s before the 851.93 mechanic;\n-- P5 LB3 fires at 1164.78, 5s into Forsaken Null's 1159.78 cast).\n-- untilTL: end of that LB reaction's window.\nlocal LB3_STUN = 4.5 + 3.78   -- cast bar + animation lock, keep in sync with LOCK in Stun Sync\nif rec then\n    rec.lb = rec.lb or {\n        p4 = { name = \"LB3 P4\", tl = 850.93,  untilTL = 861.93 },\n        p5 = { name = \"LB3 P5\", tl = 1164.78, untilTL = 1175.78 },\n    }\n    for key, slot in pairs(rec.lb) do\n        if not slot.claimed then\n            local want = lb[key]\n            if slot.id and (not want or now > slot.untilTL + rec.offset) then\n                acr.removeAutoSimPhase(slot.id)\n                slot.id = nil\n                slot.expired = want\n            elseif not slot.id and want and not slot.expired and now < slot.untilTL + rec.offset then\n                slot.start   = math.max(slot.tl + rec.offset, now)\n                slot.stunEnd = slot.start + LB3_STUN\n                slot.id      = acr.addAutoSimPhase(\"Stun\", slot.start, slot.stunEnd)\n            end\n        end\n    end\nend\n\nlocal function row(a, b, c, d, e)\n    GUI:Text(a)\n    GUI:SameLine(150) GUI:Text(b)\n    GUI:SameLine(220) GUI:Text(c)\n    GUI:SameLine(290) GUI:Text(d)\n    GUI:SameLine(360) GUI:Text(e)\nend\n\nlocal flags = GUI.WindowFlags_NoCollapse + GUI.WindowFlags_AlwaysAutoResize\nGUI:SetNextWindowSize(440, 0, GUI.SetCond_Always)\nlocal visible = GUI:Begin(\"AutoSim P4 Sync###CherryAutoSimP4Sync\", true, flags)\n\nif visible then\n    row(\"Clock\", \"Timeline\", \"Combat\", \"AutoSim\", \"\")\n    row(\"Now\", string.format(\"%.2f\", timeline), string.format(\"%.2f\", combat), string.format(\"%.2f\", now), \"\")\n    row(\"AutoSim minus\", string.format(\"%+.2f\", now - timeline), string.format(\"%+.2f\", now - combat), \"\", \"\")\n    GUI:Separator()\n\n    lb.p4 = GUI:Checkbox(\"LB3 in P4 (850.9)##CherryLB3P4\", lb.p4)\n    GUI:SameLine(220)\n    lb.p5 = GUI:Checkbox(\"LB3 in P5 (1164.8)##CherryLB3P5\", lb.p5)\n\n    -- Last LB3 stun from [AutoSim] LB3 Stun Sync. \"First action\" is when the\n    -- player next acted; positive means the stun ended before the lock did.\n    local lbs = data.Cherry_AutoSimLB3\n    if lbs then\n        GUI:Text(string.format(\"LB3 stun %.2f - %.2f%s\", lbs.start, lbs.stunEnd,\n            lbs.cancelled and \"  (cast cancelled)\" or \"\"))\n        if lbs.unlock then\n            GUI:SameLine(220)\n            GUI:Text(string.format(\"first action %.2f (%+.2f)\", lbs.unlock, lbs.unlock - lbs.stunEnd))\n        end\n    end\n    GUI:Separator()\n\n    if not rec then\n        GUI:TextColored(0.6, 0.6, 0.6, 1.0, \"P4 not synced yet (syncs when Exdeath dies, re-aligns when Kefka appears).\")\n    else\n        -- The timeline resyncs when Kefka appears, so AutoSim - Timeline is only a\n        -- real offset from then on.\n        local synced = rec.checks[1].actual ~= nil\n        local live   = now - timeline\n\n        GUI:Text(string.format(\"Exdeath died at %.2f; Kefka predicted %.2f (+%.2f)\",\n            rec.exdeathAt, 801.9 + rec.syncOffset, rec.kefkaDelay))\n        GUI:Text(string.format(\"Offset at sync %+.2f   in use %+.2f\", rec.syncOffset, rec.offset))\n        if synced then\n            local drift = live - rec.offset\n            local r, g, b = 0.3, 0.9, 0.4\n            if math.abs(drift) >= 1.5 then\n                r, g, b = 1.0, 0.4, 0.4\n            elseif math.abs(drift) >= 0.5 then\n                r, g, b = 0.95, 0.75, 0.2\n            end\n            GUI:TextColored(r, g, b, 1.0, string.format(\"Live offset %+.2f   drift %+.2f\", live, drift))\n        else\n            GUI:TextColored(0.6, 0.6, 0.6, 1.0, \"Live offset: waiting for Kefka (timeline not resynced)\")\n        end\n\n        GUI:Separator()\n        row(\"Checkpoint\", \"Timeline\", \"Expected\", \"Actual\", \"Drift\")\n        for i = 1, #rec.checks do\n            local c = rec.checks[i]\n            row(c.name,\n                string.format(\"%.1f\", c.timeline),\n                string.format(\"%.2f\", c.expected or (c.timeline + rec.offset)),\n                c.actual and string.format(\"%.2f\", c.actual) or \"-\",\n                c.drift and string.format(\"%+.2f\", c.drift) or \"-\")\n        end\n\n        GUI:Separator()\n        row(\"Phase\", \"Start\", \"End\", \"TL start\", \"ID\")\n        for i = 1, #rec.phases do\n            local p = rec.phases[i]\n            row(p.phaseType,\n                string.format(\"%.2f\", p.startTime),\n                string.format(\"%.2f\", p.endTime),\n                string.format(\"%.1f\", p.startTime - rec.offset),\n                tostring(p.id))\n        end\n        for _, slot in pairs(rec.lb) do\n            if slot.id or slot.claimed then\n                row(slot.name .. (slot.claimed and \" (cast)\" or \"\"),\n                    string.format(\"%.2f\", slot.start),\n                    string.format(\"%.2f\", slot.stunEnd),\n                    string.format(\"%.1f\", slot.start - rec.offset),\n                    tostring(slot.id))\n            elseif slot.expired then\n                row(slot.name, \"-\", \"-\", \"no cast\", \"removed\")\n            end\n        end\n\n        -- [AutoSim] P4 Checkpoints already re-aligns when Kefka appears; this\n        -- is for a manual re-align later. Kill time (1116) is fixed.\n        if synced and rec.realign then\n            GUI:Separator()\n            if GUI:Button(string.format(\"Re-align future phases by %+.2f##CherryP4Realign\", live - rec.offset), -1, 24) then\n                rec.realign(live)\n            end\n        end\n\n        for i = 1, #rec.realigns do\n            local a = rec.realigns[i]\n            GUI:Text(string.format(\"Re-aligned at %.2f: %+.2f -> %+.2f\", a.at, a.from, a.to))\n        end\n    end\nend\n\nGUI:End()\nself.used = true\n",
							name = "Draw P4 sync window",
							uuid = "fd626228-dcbb-1f6c-bcc7-a4dedbb06830",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				eventType = 13,
				mechanicTime = 15.261765625,
				name = "[AutoSim] P4 Sync GUI",
				timeRange = true,
				timelineIndex = 1,
				timerEndOffset = 1200,
				timerStartOffset = -16,
				uuid = "fd997697-8c3d-c0f9-ab2b-8079085b96eb",
				version = 2,
			},
		},
	}, 
	[38] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local acr = TensorCore.API.TensorACR\nlocal now = acr.getAutoSimTime()\nlocal id = data.Cherry_AutoSimP1ModID\n\n-- Lower the Tele-trouncing BossModifier that [AutoSim] Start added, in place,\n-- rather than adding a second phase over the same window.\nif id and now < 197.5 then\n    acr.setAutoSimPhase(id, now, 197.5, 0.2)\n\td(\"Setting p1 modifer to 0.2\")\nend\n\nself.used = true\n",
							conditions = 
							{
								
								{
									"9db718a9-5233-7dcc-917d-d82ce3827dd6",
									true,
								},
							},
							name = "BossModifier 0.8 -> 0.6 until 197.5",
							uuid = "abf95601-c3f8-63e2-998a-d345cffce0a8",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Filter",
							conditions = 
							{
								
								{
									"5755a9b6-e9e6-4df6-a21a-3f40399f69f7",
									true,
								},
							},
							filterTargetType = "Enemy",
							name = "Nearest enemy",
							uuid = "9db718a9-5233-7dcc-917d-d82ce3827dd6",
							version = 3,
						},
						inheritedIndex = 1,
					},
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 2,
							hpValue = 16,
							partyTargetName = "Kefka",
							partyTargetSubType = "Lowest HP",
							partyTargetType = "Detection Target",
							uuid = "5755a9b6-e9e6-4df6-a21a-3f40399f69f7",
							version = 3,
						},
					},
				},
				mechanicTime = 197.52218784626,
				name = "[AutoSim] P1 Low HP",
				timeRange = true,
				timelineIndex = 38,
				timerEndOffset = -1,
				timerStartOffset = -25,
				uuid = "70440511-cefe-fb78-a69a-094d5f8d15c6",
				version = 2,
			},
			inheritedIndex = 1,
		},
	},
	[39] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "AutoSim",
				uuid = "2e876c3b-f721-a139-878c-ee54e1640462",
			},
			objectType = "folder",
		},
	},
	[74] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							acrOptionType = "Hold Action",
							conditions = 
							{
								
								{
									"ed3c6767-5791-17f5-955b-1333f3632039",
									true,
								},
							},
							gVar = "ACR_TensorViper4_CD",
							holdActionDuration = 12,
							holdActionID = 34626,
							uuid = "630f2a06-5da7-f94d-9742-35d1541a47b0",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Self",
							conditionType = 13,
							jobValue = "VIPER",
							uuid = "ed3c6767-5791-17f5-955b-1333f3632039",
							version = 3,
						},
					},
				},
				enabled = false,
				mechanicTime = 381.48132335556,
				name = "[Autosim] VPR Hold Reawaken",
				timelineIndex = 74,
				timerOffset = -10,
				uuid = "9163b670-2875-23f1-801b-e45ee5bd12f4",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "local acr = TensorCore.API.TensorACR\nlocal now = acr.getAutoSimTime()\nlocal id = data.Cherry_AutoSimP2ModID\ndata.Cherry_AutoSimP2ModID = nil\n\n-- Kefka is as good as dead: nothing dealt from here until he leaves (381.5)\n-- counts. Drop the 0.5x pre-untargetable BossModifier that [AutoSim] Start\n-- added to 0 and pull its start back to now, in place, rather than adding a\n-- second phase over the same window.\nif id and now < 381.5 then\n    acr.setAutoSimPhase(id, now, 381.5, 0)\n    d(\"Setting p2 modifier to 0 from \" .. now)\nend\n\nself.used = true\n",
							conditions = 
							{
								
								{
									"de0e3cd9-4e0f-5134-9e85-299c99bb54fe",
									true,
								},
							},
							name = "BossModifier 0.5 -> 0 until 381.5",
							uuid = "ea61beff-8150-6346-a0b8-3ff0e77eca73",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Party",
							comparator = 2,
							conditionType = 2,
							hpValue = 0.1,
							name = "Kefka <= 0.1%",
							partyTargetType = "Detection Target",
							uuid = "e9bcc9ef-f14a-f35c-a570-1402faf9371e",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Filter",
							conditions = 
							{
								
								{
									"e9bcc9ef-f14a-f35c-a570-1402faf9371e",
									true,
								},
							},
							filterTargetType = "Enemy",
							name = "Nearest enemy",
							uuid = "de0e3cd9-4e0f-5134-9e85-299c99bb54fe",
							version = 3,
						},
					},
				},
				mechanicTime = 381.48132335556,
				name = "[AutoSim] P2 Low HP",
				timeRange = true,
				timelineIndex = 74,
				timerEndOffset = -1,
				timerStartOffset = -173,
				uuid = "56242c76-cb36-c436-bb82-66cb90e7fd46",
				version = 2,
			},
		},
	},
	[77] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "AutoSim",
				uuid = "0c3a633e-9412-174a-87ca-6e041e559ad6",
			},
			objectType = "folder",
		},
	},
	[148] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "-- Fires when Exdeath goes untargetable (dies) at the end of P3, ~4.45s before\n-- Kefka appears, so AutoSim can plan the whole P4/P5 schedule ahead of time.\n-- The timeline window (711.9 - 803.9) keeps out the brief mid-P3 untargetable.\nif eventArgs.entityContentID ~= 6052 or eventArgs.isTargetable then\n    return\nend\n\nlocal acr = TensorCore.API.TensorACR\n\n-- The timeline has NOT resynced yet here (it jumps to 801.9 when Kefka appears),\n-- so anchor on the combat clock: Kefka is targetable 4.45s from now (measured\n-- 4.28-4.55 over 26 pulls). Timeline times below + offset = AutoSim time.\n-- If Exdeath died before Chaos this is early; [AutoSim] P4 Checkpoints\n-- re-aligns everything when Kefka actually appears.\nlocal KEFKA_DELAY = 4.45\nlocal now    = acr.getAutoSimTime()\nlocal offset = now + KEFKA_DELAY - 801.9\n\nd(\"AutoSimTime: \" .. now)\nd(\"Offset: \" .. offset)\n\nacr.setAutoSimKillTime(1116)   -- already combat time, so no offset. Measured\n                               -- 1116.11 and 1116.25 on two clears.\nacr.clearAutoSimUncertainty()\n\n-- [AutoSim] Start predicted both downtimes at the pull; move those same phases\n-- onto the real times instead of clearing and re-adding. Consumed here.\nlocal pred = data.Cherry_AutoSimPred\ndata.Cherry_AutoSimPred = nil\n\n-- { phaseType, startTime, endTime, value, targetSlot, predicted ID }, timeline times + offset.\nlocal phases = {\n    -- Nothing is targetable.\n    { \"FullDowntime\",  now,            801.9 + offset, nil, nil, pred and pred.p3p4 },  -- Exdeath dead until Kefka appears\n    { \"FullDowntime\",  934.7 + offset,  965.7 + offset, nil, nil, pred and pred.p4p5 },  -- Kefka untargetable, P4 -> P5\n\n    --[[ Higanbana. Kefka is one entity from the P4 start to the kill.\n    { \"TargetLifetime\",   801.9 + offset, 1185.3 + offset, 1, 0 },\n    { \"DotAvailability\",  801.9 + offset,  934.7 + offset, 1, 0 },\n    { \"DotAvailability\",  965.7 + offset, 1185.3 + offset, 1, 0 },\n\t]]--\n}\n\n-- Everything this sync decided, for the [AutoSim] P4 Sync GUI and re-aligning.\n-- AutoSim has no getter for phases, so the IDs are kept here.\n-- checks are Kefka's targetable changes, filled by [AutoSim] P4 Checkpoints.\nlocal rec = {\n    exdeathAt  = now,\n    kefkaDelay = KEFKA_DELAY,\n    offset     = offset,\n    syncOffset = offset,\n    phases     = {},\n    checks     = {\n        { name = \"Kefka P4 targetable\", timeline = 801.9, targetable = true },\n        { name = \"Kefka untargetable\",  timeline = 934.7, targetable = false },\n        { name = \"Kefka P5 targetable\", timeline = 965.7, targetable = true },\n    },\n    realigns   = {},\n}\n\n-- Same-type phases must never overlap, so when moving later, move the later\n-- phase first; when moving earlier, the earlier one first.\nlocal n = #phases\nlocal later = pred and offset > pred.offset\nfor k = 1, n do\n    local i = later and (n + 1 - k) or k\n    local p = phases[i]\n    local id\n    if p[6] then\n        -- A stale ID (Start did not run this pull) raises; fall back to adding.\n        local ok, res = pcall(acr.setAutoSimPhase, p[6], p[2], p[3], p[4])\n        if ok then id = res end\n    end\n    if not id then\n        id = acr.addAutoSimPhase(p[1], p[2], p[3], p[4], p[5])\n    end\n    rec.phases[i] = {\n        phaseType = p[1],\n        startTime = p[2],\n        endTime   = p[3],\n        value     = p[4] or 1,\n        id        = id,\n    }\nend\n\n-- Moves every phase edge still in the future onto a new offset, so AutoSim\n-- matches the resynced timeline. Kill time (1116) is fixed. Called by\n-- [AutoSim] P4 Checkpoints when Kefka appears, and by the P4 Sync GUI button.\nfunction rec.realign(newOffset)\n    local t     = acr.getAutoSimTime()\n    local delta = newOffset - rec.offset\n    local count = #rec.phases\n    for k = 1, count do\n        local p = rec.phases[delta > 0 and (count + 1 - k) or k]\n        if p.id then\n            if p.startTime > t then p.startTime = p.startTime + delta end\n            if p.endTime > t then p.endTime = p.endTime + delta end\n            p.id = acr.setAutoSimPhase(p.id, p.startTime, p.endTime, p.value)\n        end\n    end\n    -- LB3 stuns scheduled by the P4 Sync GUI that have not been cast yet.\n    if rec.lb then\n        for _, slot in pairs(rec.lb) do\n            if slot.id and not slot.claimed then\n                local stun = slot.stunEnd - slot.start\n                slot.start   = math.max(slot.tl + newOffset, t)\n                slot.stunEnd = slot.start + stun\n                slot.id = acr.setAutoSimPhase(slot.id, slot.start, slot.stunEnd)\n            end\n        end\n    end\n    rec.realigns[#rec.realigns + 1] = { at = t, from = rec.offset, to = newOffset }\n    rec.offset = newOffset\nend\n\ndata.Cherry_AutoSimP4 = rec\n\nself.used = true\n",
							name = "Add P4 and P5 phases",
							uuid = "300b0b60-34cb-4af4-b808-1bd5d64054d9",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				eventType = 26,
				mechanicTime = 715.37264047081,
				name = "[AutoSim] P4 Start",
				timeRange = true,
				timelineIndex = 148,
				timerEndOffset = 88.5,
				timerStartOffset = -3.5,
				uuid = "075c79d2-21ae-d807-8cda-eb85a2e89bad",
				version = 2,
			},
			inheritedIndex = 1,
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "-- Once Chaos is below 0.1% HP he is as good as dead, and Exdeath dies a few\n-- seconds later (Chaos untargetable -> Exdeath untargetable is 2-11s over 43\n-- pulls, depends on DPS). Don't dump resources into that tail: 0.1x for 5s.\nlocal function first(cid)\n    local el = EntityList(\"contentid=\" .. cid)\n    if el then\n        for _, e in pairs(el) do return e end\n    end\nend\n\nlocal chaos   = first(7691)\nlocal exdeath = first(6052)\nif not chaos or not exdeath or not exdeath.targetable then\n    return   -- Exdeath already gone: P4 Start owns the schedule now\nend\nif chaos.hp.percent >= 0.1 then\n    return\nend\n\nlocal acr = TensorCore.API.TensorACR\nlocal now = acr.getAutoSimTime()\n\nacr.addAutoSimPhase(\"BossModifier\", now, now + 5, 0.1)\nd(\"Chaos dead 0.1x BossModifier from \" .. now)\n\nself.used = true\n",
							name = "0.1x BossModifier 5s once Chaos < 0.1%",
							uuid = "a3c334ea-4da0-0ea2-94b7-20432e2d429f",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				mechanicTime = 715.37264047081,
				name = "[AutoSim] Chaos Dead 0.1x",
				timeRange = true,
				timelineIndex = 148,
				timerEndOffset = 88.5,
				timerStartOffset = -3.5,
				uuid = "693d30e4-718d-bdb1-8ee6-ab336ce5e682",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "-- Records when Kefka's targetable changes actually land on the AutoSim clock,\n-- next to where [AutoSim] P4 Start expected them (timeline time + offset).\n-- Shown by [AutoSim] P4 Sync GUI. Re-aligns the schedule on the first one. Window 711.9 - 1005.4 covers all three.\nlocal rec = data.Cherry_AutoSimP4\nif not rec or eventArgs.entityContentID ~= 7131 then\n    return\nend\n\nlocal now = TensorCore.API.TensorACR.getAutoSimTime()\nif now < rec.exdeathAt then\n    return   -- left over from an earlier pull\nend\n\n-- Checks happen in order: P4 targetable, untargetable, P5 targetable.\nfor i = 1, #rec.checks do\n    local c = rec.checks[i]\n    if not c.actual then\n        if c.targetable ~= eventArgs.isTargetable then\n            return\n        end\n        c.actual   = now\n        c.expected = c.timeline + rec.offset\n        c.drift    = now - c.expected\n        -- Kefka appearing is the real P4 start: always re-align to it, so an\n        -- early sync (e.g. Exdeath died before Chaos) needs no button press.\n        if i == 1 and rec.realign then\n            rec.realign(now - c.timeline)\n            d(string.format(\"P4 auto re-align by %+.2f\", c.drift))\n        end\n        self.used = true\n        return\n    end\nend\n",
							name = "Record Kefka targetable changes",
							uuid = "98083d12-771d-1f8c-82a5-c504498d35ee",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
				},
				eventType = 26,
				loop = true,
				mechanicTime = 715.37264047081,
				name = "[AutoSim] P4 Checkpoints",
				timeRange = true,
				timelineIndex = 148,
				timerEndOffset = 290,
				timerStartOffset = -3.5,
				uuid = "4968b69d-f5c3-1514-9c4e-24c3aa252748",
				version = 2,
			},
		},
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "Lua",
							actionLua = "-- Tells AutoSim the player cannot act for World-swallower's cast bar plus the\n-- animation lock after it. Anchored to the real cast start: the elapsed channel\n-- time is subtracted, so a late pulse does not shift the window. Stays queued\n-- until the channel ends; a cancelled cast trims the stun to that moment.\n-- If [AutoSim] P4 Sync GUI already scheduled this LB3's stun (rec.lb), that\n-- phase is claimed and moved onto the real cast instead of adding a second,\n-- overlapping one. Shown by the GUI (data.Cherry_AutoSimLB3).\n--\n-- LOCK: cast start 833.886 -> next action (Uncoiled Fury) 842.17 = 8.28s,\n-- minus the 4.5s cast bar. If the GUI's \"first action\" keeps landing late or\n-- early by the same amount, adjust LOCK here and LB3_STUN in the GUI.\nlocal LOCK  = 3.78\nlocal CLAIM = 15     -- a scheduled stun within this many seconds is this cast's\n\nlocal acr     = TensorCore.API.TensorACR\nlocal now     = acr.getAutoSimTime()\nlocal cast    = TensorCore.mGetPlayer().castinginfo\nlocal casting = cast.channelingid == eventArgs.spellID\n\nlocal rec = self.rec\nif not rec then\n    local elapsed = casting and cast.channeltime or 0\n    local start   = now - elapsed\n    rec = {\n        start   = start,\n        castEnd = start + eventArgs.channelTimeMax,\n        stunEnd = start + eventArgs.channelTimeMax + LOCK,\n    }\n\n    local p4 = data.Cherry_AutoSimP4\n    local slot\n    if p4 and p4.lb then\n        local a, b = p4.lb.p4, p4.lb.p5\n        if a.id and not a.claimed and math.abs(a.start - start) <= CLAIM then\n            slot = a\n        elseif b.id and not b.claimed and math.abs(b.start - start) <= CLAIM then\n            slot = b\n        end\n    end\n\n    if slot then\n        local predicted = slot.start\n        slot.claimed = true\n        rec.id = acr.setAutoSimPhase(slot.id, rec.start, rec.stunEnd)\n        slot.id, slot.start, slot.stunEnd = rec.id, rec.start, rec.stunEnd\n        rec.slot = slot\n        d(string.format(\"[AutoSim] %s stun moved %+.2f onto cast: %.2f - %.2f\",\n            slot.name, rec.start - predicted, rec.start, rec.stunEnd))\n    else\n        rec.id = acr.addAutoSimPhase(\"Stun\", rec.start, rec.stunEnd)\n        d(string.format(\"[AutoSim] LB3 stun %.2f - %.2f (id %s)\", rec.start, rec.stunEnd, tostring(rec.id)))\n    end\n    self.rec = rec\n    data.Cherry_AutoSimLB3 = rec\nend\n\nif casting then\n    return\nend\n\nif not rec.done then\n    rec.done = true\n    -- Ended well before the cast bar would have: cancelled, so no lock follows.\n    if now < rec.castEnd - 0.5 then\n        rec.cancelled = true\n        rec.stunEnd   = math.max(now, rec.start + 0.01)\n        if rec.id then\n            rec.id = acr.setAutoSimPhase(rec.id, rec.start, rec.stunEnd)\n        end\n        if rec.slot then\n            rec.slot.id, rec.slot.stunEnd = rec.id, rec.stunEnd\n        end\n        d(string.format(\"[AutoSim] LB3 cancelled, stun trimmed to %.2f\", rec.stunEnd))\n        self.used = true\n        return\n    end\nend\n\n-- Completed. Measure when the player next acts (auto-attacks excluded) so the\n-- GUI can show whether LOCK matches. Only once lastcastid shows the LB itself,\n-- otherwise a stale ID would read as an instant unlock.\nif not rec.sawLB then\n    rec.sawLB = cast.lastcastid == eventArgs.spellID\nelseif cast.lastcastid ~= eventArgs.spellID and cast.lastcastid ~= 7 then\n    rec.unlock = now\n    d(string.format(\"[AutoSim] LB3 first action %.2f (%+.2f vs stun end)\", now, now - rec.stunEnd))\n    self.used = true\n    return\nend\n\nif now > rec.stunEnd + 5 then\n    self.used = true   -- nothing measured; the stun itself is already set\nend\n",
							conditions = 
							{
								
								{
									"a5d7a453-f244-7f3e-856a-968d0528c362",
									true,
								},
								
								{
									"09c9da20-593b-8537-989f-4801cdcfba1a",
									true,
								},
								
								{
									"b373ea75-2372-e1a4-a093-d088186a1873",
									true,
								},
							},
							name = "Stun for cast + lock",
							uuid = "8198bd1e-9e6a-35f5-8a5a-33fd462faf9d",
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Event",
							dequeueIfLuaFalse = true,
							eventArgType = 2,
							eventSpellID = 34866,
							name = "World-swallower",
							uuid = "a5d7a453-f244-7f3e-856a-968d0528c362",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "return eventArgs.entityID == TensorCore.mGetPlayer().id\n",
							dequeueIfLuaFalse = true,
							name = "Cast By Self",
							uuid = "09c9da20-593b-8537-989f-4801cdcfba1a",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 13,
							jobValue = "VIPER",
							name = "Viper",
							uuid = "b373ea75-2372-e1a4-a093-d088186a1873",
							version = 3,
						},
					},
				},
				eventType = 3,
				loop = true,
				mechanicTime = 715.37264047081,
				name = "[AutoSim] LB3 Stun Sync",
				timeRange = true,
				timelineIndex = 148,
				timerEndOffset = 490,
				timerStartOffset = -3.5,
				uuid = "59b08723-b92c-471d-b408-5c47ffcd0d3c",
				version = 2,
			},
		},
	},
	[158] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"81244043-b79b-ea2d-99bc-afb56e8b1cc3",
									true,
								},
								
								{
									"eefd48e0-7542-7eb7-96b1-f254061b6c1e",
									true,
								},
							},
							gVar = "ACR_TensorViper4_Hotbar_LimitBreak",
							uuid = "923efef5-1d31-4d71-8cd7-9454d27d37e4",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "-- Ticked in [AutoSim] P4 Sync GUI. Nil until that window has drawn once.\nreturn Cherry_AutoSimLB ~= nil and Cherry_AutoSimLB.p4 == true\n",
							name = "LB3 P4 Ticked",
							uuid = "81244043-b79b-ea2d-99bc-afb56e8b1cc3",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 13,
							jobValue = "VIPER",
							name = "Viper",
							uuid = "eefd48e0-7542-7eb7-96b1-f254061b6c1e",
							version = 3,
						},
					},
				},
				mechanicTime = 851.93288409656,
				name = "[AutoSim] P4 LB3",
				timeRange = true,
				timelineIndex = 158,
				timerEndOffset = 10,
				timerStartOffset = -1,
				uuid = "72774561-0edf-71ab-a6ee-c14e920f4709",
				version = 2,
			},
		},
	},
	[171] = 
	{
		
		{
			data = 
			{
				displayPath = "",
				name = "AutoSim",
				uuid = "2d3a7ef9-af9b-5792-9632-f1e3eb401c99",
			},
			objectType = "folder",
		},
	},
	[227] = 
	{
		
		{
			data = 
			{
				actions = 
				{
					
					{
						data = 
						{
							aType = "ACR",
							conditions = 
							{
								
								{
									"17f3fd3e-d6a6-5a62-b1bd-7f5725b6525b",
									true,
								},
								
								{
									"00abe57a-2966-13da-868d-42ca354c608e",
									true,
								},
							},
							gVar = "ACR_TensorViper4_Hotbar_LimitBreak",
							uuid = "d7e9d9cc-dec6-4c4b-8248-fc283ac10760",
							variableTogglesType = 2,
							version = 2.1,
						},
					},
				},
				conditions = 
				{
					
					{
						data = 
						{
							category = "Lua",
							conditionLua = "-- Ticked in [AutoSim] P4 Sync GUI. Nil until that window has drawn once.\nreturn Cherry_AutoSimLB ~= nil and Cherry_AutoSimLB.p5 == true\n",
							name = "LB3 P5 Ticked",
							uuid = "17f3fd3e-d6a6-5a62-b1bd-7f5725b6525b",
							version = 3,
						},
					},
					
					{
						data = 
						{
							category = "Self",
							conditionType = 13,
							jobValue = "VIPER",
							name = "Viper",
							uuid = "00abe57a-2966-13da-868d-42ca354c608e",
							version = 3,
						},
					},
				},
				mechanicTime = 1185.8235474604,
				name = "[AutoSim] P5 LB3",
				timeRange = true,
				timelineIndex = 227,
				timerEndOffset = -10.04,
				timerStartOffset = -21.04,
				uuid = "71860582-1171-2c14-9ba8-5839f2937eb2",
				version = 2,
			},
		},
	},
	inheritedProfiles = 
	{
	},
	timelineName = "dmu",
	version = "1.5.5",
}



return tbl