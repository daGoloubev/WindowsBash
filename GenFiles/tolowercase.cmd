:: ========================================================================= ::
:: Makes File have names that are lower case.
:: Example: VLM-KMVFE-2187 becomes vlm-kmvfe-2187
:: @author: Daniel Rasmussen
:: ======================================================================== ::
@echo off
for /f "Tokens=*" %%f in ('dir /l/b/a-d') do (
  rename %%f %%f && (
      echo %%f was renamed.
    ) || (
      echo %%f failed to rename.
  )
)
