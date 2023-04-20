-- Script created a long time ago, by Foxtery#5526
-- Check if a streamfile is bigger then 10mb if so it print a warning in the Console.
-- I don't offer support for this plugin anymore.

function PrintLoadedStreamfileSizes()
    local maxSize = 10000000 -- 10 MB
    local loadedStreamfiles = {}
    local streamfileDirectory = 'stream/'
    
    local function scanStreamDir(dir)
        local streamfileFindHandle = FindFirstFile(dir.."/*")
        local found, streamfile = false, nil

        while streamfileFindHandle and not found do
            if string.sub(streamfileFindHandle.name, 1, 1) ~= "." then
                if streamfileFindHandle.directory then
                    scanStreamDir(dir.."/"..streamfileFindHandle.name)
                else
                    streamfile = streamfileFindHandle.name
                    if not loadedStreamfiles[streamfile] then
                        local streamfilePath = dir.."/"..streamfile
                        local streamfileSize = fileLength(streamfilePath)
                        loadedStreamfiles[streamfile] = streamfileSize
                        if streamfileSize > maxSize then
                            print("WARNING: Streamfile "..streamfilePath.." is too large ("..streamfileSize.." bytes). This may cause lag.")
                        else
                            print("Streamfile "..streamfilePath..": "..streamfileSize.." bytes. This should not cause lag, but it is not guaranteed.")
                        end
                    end
                end
            end

            found, streamfileFindHandle = FindNextFile(streamfileFindHandle.handle)
        end

        if streamfileFindHandle then
            FindClose(streamfileFindHandle.handle)
        end
    end

    Citizen.CreateThread(function()
        scanStreamDir(streamfileDirectory)
    end)
end

function fileLength(path)
    local file = io.open(path, "r")
    if file then
        local length = file:seek("end")
        io.close(file)
        return length
    else
        return -1
    end
end

Citizen.CreateThread(function()
    PrintLoadedStreamfileSizes()
end)
