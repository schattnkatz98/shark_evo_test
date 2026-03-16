
function hideMenu()
    if gg.isVisible(true) then
        gg.setVisible(false)
    else
        gg.setVisible(true)
    end
end
hideMenu()

hexPatch = ''


function hexSearch()
gg.searchNumber('h 00 00 80 3F 00 00 A0 41 00 00 A0 41 00 00 C0 3F 00 00 C8 42 00 00 20 40 00 00 F0 40 00 00 00 40 00 00 00 40 00 00 80 3F 00 00 80 3F 00 00 40 40 33 33 13 40 33 33 13 40 00 00 80 3F 00 00 C0 3E 00 00 80 3E 00 00 80 3F 00 00 04 42 00 00 80 3F 00 00 00 3F 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 CD CC CC 3D 00 00 C0 3F')
res = gg.getResults(gg.getResultsCount())
gg.addListItems(res)
return res
end



function menu(res)
    while true do
   
        local mc = gg.multiChoice({'BaseSpeed ⚡', 'Tornadoeat 🦈' , 'UnlSpeed 🏃‍♂️','UnlHealth ❤️','exit'}, nil, 'made by skulduggery98 :)')
    
        if mc == nil then
            gg.toast("No selection made, hiding menu.")
            gg.setVisible(false)
            while not gg.isVisible() do
                gg.sleep(100) 
            end
            gg.setVisible(false)  
        else
          
            if mc[1] then
                    PatchBaseSpeed(res)
            end

            if mc[2] then
                local BiteRadius = 10
                PatchBiteRadius(BiteRadius)

            end

            if mc[3] then
                PatchSpeedBar()
            end

            if mc[4] then
                PatchHealthBar()
            end

            if mc[5] then
                gg.toast("Exiting script...")
                os.exit()
            end
        end
    end
end


function PatchBaseSpeed(res)
    local hexPatch = 'h 00 00 80 3F 00 00 A0 41 00 00 A0 41 00 00 C0 3F 00 00 C8 42 00 00 20 40 00 00 C8 41 00 00 00 40 00 00 00 40 00 00 80 3F 00 00 80 3F 00 00 40 40 33 33 13 40 33 33 13 40 00 00 80 3F 00 00 C0 3E 00 00 80 3E 00 00 80 3F 00 00 04 42 00 00 80 3F 00 00 00 3F 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 CD CC CC 3D 00 00 C0 3F'
    gg.setValues(res)
    gg.editAll(hexPatch, gg.TYPE_BYTE)
    gg.clearResults()
end




function main()
    gg.clearResults()
    local res = hexSearch()
    menu(res)
end
main()
