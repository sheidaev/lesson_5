FROM ubuntu:24.04

# Встановлюємо українську локалізацію та необхідні пакети
RUN apt-get update && apt-get install -y --no-install-recommends \
    locales \
    git \
    curl \
    wget \
    vim \
    sudo \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Генеруємо українську локалізацію
RUN locale-gen uk_UA.UTF-8

# Встановлюємо українську як локаль за замовчуванням
ENV LANG=uk_UA.UTF-8
ENV LANGUAGE=uk_UA:uk
ENV LC_ALL=uk_UA.UTF-8

# Створюємо групу та користувача
RUN groupadd sheidaev_group && \
    useradd -m -s /bin/bash -g sheidaev_group sheidaev && \
    echo "sheidaev:1234" | chpasswd && \
    usermod -aG sudo sheidaev

# Налаштовуємо sudo для користувача sheidaev без пароля
RUN echo "sheidaev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Створюємо директорію для монтування
RUN mkdir -p /workspace

# Встановлюємо робочу директорію
WORKDIR /workspace

# Переключаємося на користувача sheidaev
USER sheidaev

# Відкриваємо bash при запуску
CMD ["/bin/bash"] 