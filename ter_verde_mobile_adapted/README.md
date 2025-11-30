# Tere-Verde - Mobile-adapted package

Versão adaptada para mobile. Este repositório contém uma pequena aplicação Flask usada para demonstração.

## Como configurar e rodar (Windows - PowerShell)

1. Abra o PowerShell na pasta do projeto:

```powershell
cd 'C:\Users\Rocha\Desktop\mvp-mobile\ter_verde_mobile_adapted'
```

2. Rode o script de configuração (cria `.venv` e instala dependências):

```powershell
.\setup_env.ps1
```

3. Copie `.env.example` para `.env` e ajuste se quiser mudar porta / debug:

```powershell
copy .env.example .env
notepad .env
```

4. Execute a aplicação (ativa `.venv` e roda `app.py`):

```powershell
.\start.ps1
```

5. Abra no navegador: http://127.0.0.1:5000/ (ou na porta que você definiu em `.env`).

---

Produção / WSGI: recomendamos usar um servidor de produção. No Windows você pode usar `waitress`:

```powershell
pip install waitress
waitress-serve --listen=0.0.0.0:8080 app:app
```