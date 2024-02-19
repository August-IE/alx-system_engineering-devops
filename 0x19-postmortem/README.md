Postmortem

Issue Summary:

Duration: The outage occurred from approximately 09:07 to 04:20 West Africa Time (WAT).
Impact: The Apache web server running a Holberton WordPress site experienced downtime, resulting in 500 Internal Server Errors for users attempting to access the site.

Root Cause: A typo in the file path within the wp-settings.php file caused the server to attempt to access a non-existent file, leading to the server errors.

Timeline:

Issue detected: Around 09:07 WAT, users reported encountering 500 Internal Server Errors.
Detection method: User complaints and monitoring alerts indicated the server outage.
Actions taken: Investigated running processes, examined Apache configuration, utilized strace for debugging, and identified the erroneous file path.
Misleading paths: Initial debugging efforts with strace on the root Apache process yielded no useful information.
Escalation: The issue was escalated to my cohort & also did some online research for resolution.
Resolution: The typo in the file path was corrected by removing the trailing 'p' in the wp-settings.php file.

Root Cause and Resolution:
Cause: The typo in the file path within the wp-settings.php file, leading to the server attempting to access a non-existent file.
Resolution: The erroneous file path was corrected by removing the trailing 'p' in the wp-settings.php file, restoring the server's functionality.
Corrective and Preventative Measures:

Improvement Areas:
Enhanced testing procedures to catch such errors before deployment.
Automation of error-fixing processes using Puppet manifests or similar tools.

Tasks:
Conduct thorough testing of applications before deployment to identify and address potential errors.
Implement uptime monitoring services to detect and respond to server outages promptly.
Develop automation scripts or manifests to address common errors and streamline troubleshooting processes.
Conduct regular code reviews and quality assurance checks to catch errors and typos in codebase.
Provide training and awareness sessions for team members to emphasize the importance of error prevention and mitigation strategies.

In summary, the outage was caused by a simple typo in the file path, resulting in server errors for users attempting to access the Holberton WordPress site. The issue was promptly detected and resolved through debugging efforts, leading to the correction of the erroneous file path. Moving forward, enhanced testing, monitoring, and automation processes will be implemented to prevent similar outages and improve system reliability and performance.

In the end nothing beats the joy you get when you eventually conquer a seemingly daunting task. Keep doing hard things :muscle: 😉
