cask "macnewfile" do                                                                                                          
    version "3.1.0"                                                                                                             
    sha256 "fb6420b52165cbb8c42637b5e94a64801f3483f28fe4e0e26dabe85c70df8398"                                                   
                                                                                                                                
    url "https://github.com/GarfieldFluffJr/MacNewFile/releases/download/v#{version}/MacNewFile.zip"                            
    name "MacNewFile"                                                                                                           
    desc "Create new files from Finder right-click menu"                                                                        
    homepage "https://github.com/GarfieldFluffJr/MacNewFile"                                                                    
                                                                                                                                
    depends_on macos: ">= :ventura"                                                                                             
                                                                                                                                
    app "MacNewFile.app"                                                                                                        
                                                                                                                                
    postflight do                                                                                                               
      system_command "/usr/bin/xattr",                                                                                          
                     args: ["-cr", "#{appdir}/MacNewFile.app"]                                                                  
    end                                                                                                                         
                                                                                                                                
    uninstall quit: "com.louieyin.MacNewFile"                                                                                   
                                                                                                                                
    zap trash: [                                                                                                                
      "~/Library/Preferences/com.louieyin.MacNewFile.plist",                                                                    
      "~/Library/Group Containers/group.com.louieyin.MacNewFile",                                                               
    ]                                                                                                                           
  end