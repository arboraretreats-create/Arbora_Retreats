"use client";

import { useEffect } from "react";

export default function ArboraInitializer() {
  useEffect(() => {
    // 1. Initial fade-in animations for hero & header
    const mainHeader = document.getElementById("mainHeader");
    const heroContent = document.getElementById("heroContent");
    if (mainHeader) mainHeader.classList.add("hero-fade-active");
    if (heroContent) heroContent.classList.add("hero-fade-active");

    // 2. Play videos
    const vDesk = document.getElementById("heroVideoDesktop") as HTMLVideoElement | null;
    const vMob = document.getElementById("heroVideoMobile") as HTMLVideoElement | null;
    if (vDesk) { vDesk.playbackRate = 0.75; vDesk.play().catch(() => {}); }
    if (vMob) { vMob.playbackRate = 0.75; vMob.play().catch(() => {}); }

    // 3. Scroll progress bar & header shrink
    const handleScroll = () => {
      const bar = document.getElementById("scrollProgressBar");
      const totalH = document.documentElement.scrollHeight - window.innerHeight;
      if (totalH > 0 && bar) {
        bar.style.width = ((window.scrollY / totalH) * 100) + "%";
      }
    };
    window.addEventListener("scroll", handleScroll, { passive: true });

    // 4. Reveal on scroll
    let observer: IntersectionObserver | null = null;
    if ("IntersectionObserver" in window) {
      observer = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add("is-visible");
            observer?.unobserve(entry.target);
          }
        });
      }, { threshold: 0.15 });

      document.querySelectorAll(".reveal-on-scroll").forEach((el) => {
        observer?.observe(el);
      });
    }

    // 5. Attach global helpers for onclick handlers in rendered HTML
    (window as any).toggleMobileMenu = function() {
      const menu = document.getElementById("mobileDropdown");
      if (menu) {
        if (menu.classList.contains("hidden")) {
          menu.classList.remove("hidden");
        } else {
          menu.classList.add("hidden");
        }
      }
    };

    (window as any).openModal = function() {
      const bookingModal = document.getElementById("bookingModal");
      if (bookingModal) bookingModal.classList.remove("hidden");
    };

    (window as any).closeModal = function() {
      const bookingModal = document.getElementById("bookingModal");
      if (bookingModal) bookingModal.classList.add("hidden");
    };

    (window as any).handleFormSubmit = function(e: Event) {
      e.preventDefault();
      alert("Welcome to Arbora! You are now registered as an Arboran. Our team will reach out with upcoming community gathering invites.");
      (window as any).closeModal();
    };

    (window as any).startQuiz = function() {
      const q1 = document.getElementById("quizStep1");
      const qres = document.getElementById("quizResult");
      const qmodal = document.getElementById("quizModal");
      if (q1) q1.classList.remove("hidden");
      if (qres) qres.classList.add("hidden");
      if (qmodal) qmodal.classList.remove("hidden");
    };

    (window as any).quizSelect = function(name: string) {
      const q1 = document.getElementById("quizStep1");
      const title = document.getElementById("quizMatchedTitle");
      const qres = document.getElementById("quizResult");
      if (q1) q1.classList.add("hidden");
      if (title) title.innerText = name + " Circle";
      if (qres) qres.classList.remove("hidden");
    };

    (window as any).closeQuizModal = function() {
      const qmodal = document.getElementById("quizModal");
      if (qmodal) qmodal.classList.add("hidden");
    };

    (window as any).openDestinationModal = function(title: string, tag: string, imgB64: string, desc: string) {
      const t = document.getElementById("destModalTitle");
      const img = document.getElementById("destModalImg") as HTMLImageElement | null;
      const d = document.getElementById("destModalDesc");
      const modal = document.getElementById("destinationModal");
      if (t) t.innerText = title;
      if (img) img.src = imgB64.startsWith("/") || imgB64.startsWith("http") ? imgB64 : "data:image/jpeg;base64," + imgB64;
      if (d) d.innerText = desc;
      if (modal) modal.classList.remove("hidden");
    };

    (window as any).closeDestinationModal = function() {
      const modal = document.getElementById("destinationModal");
      if (modal) modal.classList.add("hidden");
    };

    return () => {
      window.removeEventListener("scroll", handleScroll);
      if (observer) observer.disconnect();
    };
  }, []);

  return null;
}
