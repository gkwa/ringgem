import re
import pathlib

def process_install_script(file_path):
   app_name = None

   match = re.search(r'install-(.+?)-on-', file_path.name)
   if match:
       app_name = match.group(1)
   else:
       app_name = file_path.stem

   lines = file_path.read_text().splitlines()

   shebang_found = False
   comment_exists = False
   for i, line in enumerate(lines):
       if line.startswith('#!/'):
           shebang_found = True
       elif shebang_found and not line.strip():
           if f'# Installs {app_name}' in lines[i+1]:
               comment_exists = True
           break

   if not comment_exists:
       if shebang_found:
           lines.insert(1, '')
           lines.insert(2, f'# Installs {app_name}')
       else:
           lines.insert(0, f'# Installs {app_name}')

       file_path.write_text('\n'.join(lines))

current_dir = pathlib.Path('.')
for file_path in current_dir.glob('install-*.sh'):
   process_install_script(file_path)
