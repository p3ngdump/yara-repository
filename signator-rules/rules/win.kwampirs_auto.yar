rule win_kwampirs_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.kwampirs."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.kwampirs"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 391f 0f95c0 8b4df0 64890d00000000 }
            // n = 4, score = 800
            //   391f                 | cmp                 dword ptr [edi], ebx
            //   0f95c0               | setne               al
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx

        $sequence_1 = { 8965e8 8bf9 33db 3bfb }
            // n = 4, score = 800
            //   8965e8               | mov                 dword ptr [ebp - 0x18], esp
            //   8bf9                 | mov                 edi, ecx
            //   33db                 | xor                 ebx, ebx
            //   3bfb                 | cmp                 edi, ebx

        $sequence_2 = { 81ec580c0000 a1???????? 33c5 8945f8 8b4508 }
            // n = 5, score = 800
            //   81ec580c0000         | sub                 esp, 0xc58
            //   a1????????           |                     
            //   33c5                 | xor                 eax, ebp
            //   8945f8               | mov                 dword ptr [ebp - 8], eax
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_3 = { 33c9 b827000000 ba02000000 f7e2 }
            // n = 4, score = 800
            //   33c9                 | xor                 ecx, ecx
            //   b827000000           | mov                 eax, 0x27
            //   ba02000000           | mov                 edx, 2
            //   f7e2                 | mul                 edx

        $sequence_4 = { c3 32c0 8b4df0 64890d00000000 59 5f 5e }
            // n = 7, score = 800
            //   c3                   | ret                 
            //   32c0                 | xor                 al, al
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx
            //   59                   | pop                 ecx
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_5 = { 5d c3 32c0 8b4df0 64890d00000000 59 5f }
            // n = 7, score = 800
            //   5d                   | pop                 ebp
            //   c3                   | ret                 
            //   32c0                 | xor                 al, al
            //   8b4df0               | mov                 ecx, dword ptr [ebp - 0x10]
            //   64890d00000000       | mov                 dword ptr fs:[0], ecx
            //   59                   | pop                 ecx
            //   5f                   | pop                 edi

        $sequence_6 = { e8???????? 83c418 85c0 7512 8b07 }
            // n = 5, score = 800
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   85c0                 | test                eax, eax
            //   7512                 | jne                 0x14
            //   8b07                 | mov                 eax, dword ptr [edi]

        $sequence_7 = { 56 8b0f 51 e8???????? 83c418 85c0 }
            // n = 6, score = 800
            //   56                   | push                esi
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c418               | add                 esp, 0x18
            //   85c0                 | test                eax, eax

        $sequence_8 = { 50 ffd6 8b4dc4 51 ffd6 }
            // n = 5, score = 800
            //   50                   | push                eax
            //   ffd6                 | call                esi
            //   8b4dc4               | mov                 ecx, dword ptr [ebp - 0x3c]
            //   51                   | push                ecx
            //   ffd6                 | call                esi

        $sequence_9 = { 33c9 b827000000 ba02000000 f7e2 0f90c1 }
            // n = 5, score = 800
            //   33c9                 | xor                 ecx, ecx
            //   b827000000           | mov                 eax, 0x27
            //   ba02000000           | mov                 edx, 2
            //   f7e2                 | mul                 edx
            //   0f90c1               | seto                cl

    condition:
        7 of them and filesize < 2695168
}