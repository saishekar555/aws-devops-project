# Contributing to AWS DevOps Project

Thank you for your interest in contributing! This document provides guidelines and instructions for contributing to this project.

## Code of Conduct

This project adheres to the Contributor Covenant Code of Conduct. By participating, you are expected to uphold this code.

## How to Contribute

### Reporting Bugs

1. **Check existing issues** to avoid duplicates
2. **Provide clear description** of the bug
3. **Include steps to reproduce** the issue
4. **Attach relevant logs** or error messages
5. **Specify environment** (OS, AWS region, Terraform version)

### Suggesting Enhancements

1. **Use GitHub Issues** to suggest features
2. **Explain the use case** clearly
3. **Provide examples** of expected behavior
4. **Consider backward compatibility**

### Pull Request Process

1. **Fork** the repository
2. **Create feature branch**: `git checkout -b feature/your-feature`
3. **Make changes** following code standards
4. **Test thoroughly** before submitting
5. **Commit with clear messages**: `git commit -m "feat: description"`
6. **Push to fork**: `git push origin feature/your-feature`
7. **Create Pull Request** with detailed description

### Development Setup

```bash
# Clone repository
git clone https://github.com/saishekar555/aws-devops-project.git
cd aws-devops-project

# Install dependencies
terraform init

# Validate code
terraform validate
terraform fmt
```

### Commit Message Convention

Use conventional commits:
- `feat:` for new features
- `fix:` for bug fixes
- `docs:` for documentation
- `refactor:` for code refactoring
- `test:` for tests
- `chore:` for maintenance

### Code Standards

- Follow HashiCorp Terraform best practices
- Use consistent variable naming
- Add comments for complex logic
- Include security considerations
- Keep files organized and modular

### Testing

```bash
# Validate Terraform
terraform validate

# Format check
terraform fmt -check

# Plan deployment
terraform plan -out=tfplan

# Security scanning (if using tfsec)
tfsec .
```

### Documentation

- Update README.md with changes
- Document new variables
- Include usage examples
- Add troubleshooting sections

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

## Questions?

Feel free to open an issue or reach out to the maintainers.

**Maintainer:** Dammoju Sai Shekar Chary  
**Email:** GitHub Profile  
**LinkedIn:** linkedin.com/in/saishekar555
