module Paths_Remyndr (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/bmuk/.cabal/bin"
libdir     = "/Users/bmuk/.cabal/lib/x86_64-osx-ghc-7.8.3/Remyndr-0.1"
datadir    = "/Users/bmuk/.cabal/share/x86_64-osx-ghc-7.8.3/Remyndr-0.1"
libexecdir = "/Users/bmuk/.cabal/libexec"
sysconfdir = "/Users/bmuk/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Remyndr_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Remyndr_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Remyndr_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Remyndr_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Remyndr_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
