# Code Review Checklist

## Overview
Comprehensive checklist for conducting thorough code reviews to ensure quality, security, and maintainability.

## Review Guidelines
This review is purely to enhance the code, suggesting that the code already runs and output the files that it is expected to output. The exercise of checking the code is purely to see whether there are no logic errors, whether the quality is good, whether no security vulnerabilities exist, and whether the code is well documented. Do not add checks for input files existence or output folder existence. 

## Review Categories

### Functionality
- [ ] Code does what it's supposed to do
- [ ] No obvious bugs or logic errors

### Code Quality
- [ ] Code is readable and well-structured
- [ ] Functions are small and focused
- [ ] Functions are created for code blocks that are repeated
- [ ] Variable names are descriptive
- [ ] No code duplication
- [ ] Follows project conventions

### Security
- [ ] No obvious security vulnerabilities
- [ ] Sensitive data is handled properly
- [ ] No hardcoded secrets

### Documentation
- [ ] Each function is explained succintly with a comment
- [ ] All multi-lined code blocks are succintly explained with a comment